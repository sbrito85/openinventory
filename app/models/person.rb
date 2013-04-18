class Person < ActiveRecord::Base
   attr_accessible :username, :department, :title, :office_id, :accountname, :telephone,:image
   belongs_to :office
   has_many :asset

   audited
   validates_attachment :image,
                            content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
                            size: { less_than: 5.megabytes }
   has_attached_file :image, styles: { small: "96x96!"}
   def picture_from_url(url)
    self.image = open(url)
  end

  def self.search(search)
    if search
      where('(username LIKE ?) OR (department LIKE ?)', "%#{search}%" , "%#{search}%")
    else
      scoped
    end
  end
   def self.import
  # initialization stuff. set bind_dn, bind_pass, ldap_host, base_dn and filter
  Domain.all.each do |domain|

    ldap = Net::LDAP.new(:host => domain.dc, :port => 389)
    ldap.auth domain.adminUser, domain.adminPass
    ldap.base = domain.dn
    if ldap.bind
    else
      p ldap.get_operation_result
    end

    begin
    # Build the list
    #filter1 = Net::LDAP::Filter.present("thumbnailphoto")
    filter1 = Net::LDAP::Filter.present("title")
    filter2 = Net::LDAP::Filter.present("physicalDeliveryOfficeName")
    filter3 = Net::LDAP::Filter.present("department")
    #filter4 = Net::LDAP::Filter.present("telephonenumber")
    join_filter = Net::LDAP::Filter.join(filter1,filter2)
    join_filter = Net::LDAP::Filter.join(join_filter,filter3)
    #join_filter = Net::LDAP::Filter.join(join_filter,filter4)
    attrs = ["Name", "title", "department", "physicalDeliveryOfficeName", "telephoneNumber", "samAccountName", "thumbnailphoto"]
    records = new_records = 0
    domain.office.all.each do |o|
      searchbase = o.ou + ',' + domain.dn
      puts searchbase
      ldap.search(:base => searchbase, :filter => join_filter, :attrs => attrs) do |entry|
        username = entry.Name.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        title = entry.title.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        department = entry.department.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        office = entry.physicalDeliveryOfficeName.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        begin
          telephone = entry.telephonenumber.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        rescue
          telephone = ""
        end
        account = entry.samAccountName.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
        blob = ""
        begin
          entry.thumbnailphoto.each do |t| 
            blob = t
          end
          image = Magick::Image.from_blob(blob)
            image[0].write("public/users/" + account + '.jpg')
          picture = "public/users/" + account + ".jpg"
        rescue
          picture = "public/default/user.png"
        end
    

       if o.office == office
          user = Person.find_or_initialize_by_username :username => username, :title => title, :department => department,:office_id => o.id, :telephone => telephone, :accountname => account
          if user.new_record?
            user.picture_from_url picture
            user.save
            puts entry.physicalDeliveryOfficeName.to_s.strip
            new_records = new_records + 1
          else
            user.title = title
            user.department = department
            user.office_id = o.id
            user.telephone = telephone
            user.accountname = account
            user.picture_from_url picture
            user.save
          end
          records = records + 1
        end
      end
    
        p ldap.get_operation_result

        logger.info( "LDAP Import Complete: " + Time.now.to_s )
        logger.info( "Total Records Processed: " + records.to_s )
        logger.info( "New Records: " + new_records.to_s )

        end
      else

      end
    end
  end
end

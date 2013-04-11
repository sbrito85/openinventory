class Person < ActiveRecord::Base
   attr_accessible :username, :department, :title, :office_id, :accountname, :telephone
   belongs_to :office
   has_many :asset

   audited
   

   def self.import
  # initialization stuff. set bind_dn, bind_pass, ldap_host, base_dn and filter

  ldap = Net::LDAP.new(:host => "FQDNofserver", :port => 389)
  ldap.auth "admin", "password"
  ldap.base = "DC=NA,DC=domain,DC=dom"
  if ldap.bind
  else
    p ldap.get_operation_result
  end

  begin
  # Build the list
  filter1 = Net::LDAP::Filter.present("physicalDeliveryOfficeName")
  filter2 = Net::LDAP::Filter.present("title")
  filter3 = Net::LDAP::Filter.present("department")
  filter4 = Net::LDAP::Filter.present("telephonenumber")
  join_filter = Net::LDAP::Filter.join(filter1,filter2)
  join_filter = Net::LDAP::Filter.join(join_filter,filter3)
  join_filter = Net::LDAP::Filter.join(join_filter,filter4)
  attrs = ["Name", "title", "department", "physicalDeliveryOfficeName", "telephoneNumber", "samAccountName"]
  records = new_records = 0
  ldap.search(:base => "DC=na,DC=domain,DC=dom", :filter => join_filter, :attrs => attrs) do |entry|
    username = entry.Name.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    title = entry.title.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    department = entry.department.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    office = entry.physicalDeliveryOfficeName.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    telephone = entry.telephonenumber.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    account = entry.samAccountName.to_s.strip.gsub(/\[\"/,'').gsub(/\"\]/,'')
    Office.all.each do |o|
     if o.office == office
        user = Person.find_or_initialize_by_username :username => username, :title => title, :department => department,:office_id => o.id, :telephone => telephone, :accountname => account
        if user.new_record?
          user.save
          puts entry.physicalDeliveryOfficeName.to_s.strip
          new_records = new_records + 1
        else
          user.title = title
          user.department = department
          user.office_id = o.id
          user.telephone = telephone
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

class Asset < ActiveRecord::Base
  attr_accessible :person_id, :acquired, :asset, :assigned_to, :comments, :disposed, :user_id, :machine_name, :device_id, :office_id, :po_num, :refresh, :serial,:client, :created_at, :updated_at, :order_num
  belongs_to :user
  belongs_to :office
  belongs_to :device
  belongs_to :person
  has_one :rackitem

  validates :office_id, :presence => true
  validates :assigned_to, :presence => true
  validates :asset, :presence => true
  validates :device_id, :presence => true

  audited
  
  before_save { |asset|
    user_name = asset.assigned_to

    if Person.where("username = ?", user_name ).exists?
      asset.person_id = Person.find(Person.where("username = ?", user_name )).id
    end
  }
  before_update { |asset|
    user_name = asset.assigned_to

    if Person.where("username = ?", user_name ).exists?
      asset.person_id = Person.find(Person.where("username = ?", user_name )).id
      update_column(:person_id, asset.person_id)
    else
      update_column(:person_id,0)
    end
  }
  def self.search(search)
    if search
      where('(asset LIKE ?) OR (assigned_to LIKE ?)', "%#{search}%" , "%#{search}%")
    else
      scoped
    end
  end
	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |asset|
				csv << asset.attributes.values_at(*column_names)
			end
		end
	end
  def self.import(file, user_id)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      asset = find_by_id(row["id"]) || new
      asset.attributes = row.to_hash.slice(*accessible_attributes)
      asset.office_id = Office.find_by_office(row["office"]).id
      asset.device_id = Device.find_by_model(row["device"]).id
      asset.user_id = user_id
      person =  Person.where('lower(username) = ?', row["assigned_to"].downcase ).first
      puts person
      if person != nil
        asset.person_id = person.id
        asset.assigned_to = person.username
      end
      puts row["device"]
      asset.save!
    end  
  end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    #when '.csv' then Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

end

class Asset < ActiveRecord::Base
  attr_accessible :person_id, :aquired, :asset, :assigned_to, :comments, :disposed, :user_id, :machine_name, :device_id, :office_id, :po_num, :refresh, :serial,:client, :created_at, :updated_at
  belongs_to :user
  belongs_to :office
  belongs_to :device
  belongs_to :person

  validates :office_id, :presence => true
  validates :assigned_to, :presence => true
  validates :asset, :presence => true
  validates :device_id, :presence => true

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


  

end

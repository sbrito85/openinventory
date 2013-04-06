class Asset < ActiveRecord::Base
  attr_accessible :aquired, :asset, :assigned_to, :comments, :disposed, :user_id, :machine_name, :device_id, :office_id, :po_num, :refresh, :serial,:client, :created_at, :updated_at
  belongs_to :user
  belongs_to :office
  belongs_to :device
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
			all.each do |product|
				csv << product.attributes.values_at(*column_names)
			end
		end
	end

end

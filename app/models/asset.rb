class Asset < ActiveRecord::Base
  attr_accessible :aquired, :asset, :assigned_to, :comments, :disposed, :user_id, :machine_name, :device_id, :office_id, :po_num, :refresh, :serial,:client
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


end

class Serverrack < ActiveRecord::Base
  attr_accessible :name, :serverroom_id, :totalunits

  has_many :rackitem
  belongs_to :serverroom
  
end

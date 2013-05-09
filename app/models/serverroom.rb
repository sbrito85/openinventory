class Serverroom < ActiveRecord::Base
  attr_accessible :name, :office_id

  belongs_to :office
  has_many :serverrack
end

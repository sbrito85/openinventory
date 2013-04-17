class Office < ActiveRecord::Base
  attr_accessible :office, :sitecode, :domain_id, :ou
  has_many :person
  has_many :asset
  belongs_to :domain
end

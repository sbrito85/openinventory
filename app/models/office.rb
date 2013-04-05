class Office < ActiveRecord::Base
  attr_accessible :office, :sitecode

  has_many :asset
end

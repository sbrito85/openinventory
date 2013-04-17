class Domain < ActiveRecord::Base
  attr_accessible :adminPass, :adminUser, :dc, :dn, :name

  has_many :office
end

class User < ActiveRecord::Base
  before_save :set_admin
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me, :admin, :boolean, :default => false
  # attr_accessible :title, :body

  has_many :asset
  
  Devise.setup do |config|
  	config.case_insensitive_keys = [:username]
	end
  def set_admin
    puts self.id
    if self.id < 15
      self.admin = true
    end
  end
end

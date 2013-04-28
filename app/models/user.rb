class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :isAdmin
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
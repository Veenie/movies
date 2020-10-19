class User < ActiveRecord::Base
  has_secure_password
  has_many :movies
  validates :username, presence: true, uniqueness: true
  #validation for password handled by secure_password
end
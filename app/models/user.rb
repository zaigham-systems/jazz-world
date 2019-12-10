class User < ApplicationRecord
  #Validations
  validates_presence_of :name, :mobile_num, :password_digest
  validates :mobile_num, uniqueness: true

  #encrypt password
  has_secure_password
end
class User < ActiveRecord::Base
  has_secure_password

  has_one :business

  validates :first_name, :last_name, :email,  presence: true
end

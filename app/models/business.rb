class Business < ActiveRecord::Base
  belongs_to :user

  has_many :items

  validates :name, :address, :city, presence: true
end

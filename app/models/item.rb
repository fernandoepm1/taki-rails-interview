class Item < ActiveRecord::Base
  belongs_to :business

  validates :description, :price, presence: true
end

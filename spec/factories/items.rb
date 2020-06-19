FactoryBot.define do
  factory :item do
    description { FFaker::Lorem.phrase }
    price { FFaker::Lorem.phrase }
  end
end

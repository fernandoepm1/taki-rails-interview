FactoryBot.define do
  factory :item do
    business
    description { FFaker::Lorem.phrase }
    price { rand(9999) }
  end
end

FactoryBot.define do
  factory :business do
    name { FFaker::Lorem.word }
    address { FFaker::Lorem.phrase }
    city { FFaker::Lorem.word }
  end
end

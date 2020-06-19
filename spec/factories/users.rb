FactoryBot.define do
  factory :user do
    first_name { FFaker::Lorem.word }
    last_name { FFaker::Lorem.phrase }
    email { FFaker::Internet.email }
  end
end

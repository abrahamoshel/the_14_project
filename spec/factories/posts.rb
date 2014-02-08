# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    factory :valid_post do
      title { Faker::Lorem.sentence }
      body  { Faker::Lorem.paragraph }
      user  { build_stubbed :user }
    end
  end
end

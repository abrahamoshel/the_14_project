# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    factory :valid_event do
      title { Faker::Lorem.sentence }
      description { Faker::Lorem.paragraph }
      created_by { build_stubbed :user }
      contact { build_stubbed :user }
    end
  end
end

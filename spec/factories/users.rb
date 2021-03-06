# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :valid_user do
      email       { Faker::Internet.email }
      first_name  { Faker::Name.first_name }
      last_name   { Faker::Name.last_name }
      password    "password1"
      password_confirmation "password1"
    end
  end
end

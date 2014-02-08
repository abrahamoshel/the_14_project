# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    factory :valid_location do
      name { Faker::Lorem.sentence }
      addr1 { Faker::AddressUS.street_address }
      city { Faker::AddressUS.city }
      state { Faker::AddressUS.state_abbr }
      zip { Faker::AddressUS.zip_code }
    end
  end
end

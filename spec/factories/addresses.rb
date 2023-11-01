FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    number { Faker::Address.building_number }
    neighborhood { Faker::Address.community }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zipcode { Faker::Address.zip_code }
  end
end

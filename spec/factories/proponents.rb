FactoryBot.define do
  factory :proponent do
    name { Faker::Name.name }
    document { Faker::Number.leading_zero_number(digits: 11) }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    address
    personal_phone { Faker::PhoneNumber.phone_number }
    references_phone { Faker::PhoneNumber.phone_number }
    salary { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    inss_discount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end

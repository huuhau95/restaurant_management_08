require "faker"

FactoryBot.define do
  factory :booking do
    time_start "2018-07-30 03:43:59"
    time_end "2018-07-30 03:43:59"
    name{Faker::Name.name}
    email{Faker::Name.first_name+"@gmail.com"}
    address{Faker::Address.city}
    phone{Faker::IDNumber.valid}
    user_id 1
    table_id 1
  end
end

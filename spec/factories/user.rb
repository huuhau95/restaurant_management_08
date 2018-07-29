require "faker"

FactoryBot.define do
  factory :user do
    name{Faker::Name.name}
    email{Faker::Name.first_name+"@gmail.com"}
    address{Faker::Address.city}
    phone{Faker::Number.leading_zero_number(10)}
    password{"123456789"}
    password_confirmation{"123456789"}
  end
end

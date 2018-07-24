require "faker"

FactoryGirl.define do
  factory :user do
    name{Faker::Book.author}
    email{Faker::Internet.email}
    address{Faker::Name.name}
    phone{Faker::Number.leading_zero_number(10)}
    password{"123456789"}
    password_confirmation{"123456789"}
  end
end

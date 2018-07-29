require "faker"

FactoryBot.define do
  factory :table do
    name {Faker::Name.name_with_middle}
    number_of_people 1
    type_table 1
    description {Faker::Lorem.paragraph_by_chars}
  end
end

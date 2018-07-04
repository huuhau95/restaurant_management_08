class Dish < ApplicationRecord
  has_many :images, as: :imageable
  has_many :menu_dishes
  has_many :booking_details
  has_many :reviews
  belongs_to :category
end

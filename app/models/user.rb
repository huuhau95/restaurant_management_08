class User < ApplicationRecord
  has_many :bills
  has_many :bookings
  has_many :reviews
end

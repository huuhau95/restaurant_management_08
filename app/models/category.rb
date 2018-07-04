class Category < ApplicationRecord
  has_many :dishes
  has_many :menu_dishes
end

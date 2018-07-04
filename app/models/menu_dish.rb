class MenuDish < ApplicationRecord
  belongs_to :dish
  belongs_to :menu
  belongs_to :category
end

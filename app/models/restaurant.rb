class Restaurant < ApplicationRecord
    has_many :menu_items
    has_many :orders, through: :menu_items
    has_many :ratings, through: :menu_items
    has_many :users, through: :ratings
end
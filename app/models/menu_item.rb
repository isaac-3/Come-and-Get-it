class MenuItem < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders
    has_many :ingredients
    has_many :ratings
    belongs_to :restaurant
end
class Cart < ApplicationRecord
    belongs_to :user
    has_many :orders

    # validate do
    # end
end
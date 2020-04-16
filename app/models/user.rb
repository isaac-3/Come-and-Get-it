class User < ApplicationRecord
    has_secure_password()
    has_many :ratings
    has_many :carts

    # validate do
    #     if self.username
    # end
    validates :username, :presence => true, :uniqueness => true

end
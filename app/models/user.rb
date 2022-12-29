class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, length: { minimum: 6 }
end

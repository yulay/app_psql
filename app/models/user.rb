class User < ApplicationRecord
    has_secure_token :token, length: 50

    has_secure_password

    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: :password_present?
    validates :password_confirmation, length: { minimum: 6 }, if: :password_present?

    has_many :articles
    has_one :profile

    private

    def password_present?
        false || password.present?
    end
end

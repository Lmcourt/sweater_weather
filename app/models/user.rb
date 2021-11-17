class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

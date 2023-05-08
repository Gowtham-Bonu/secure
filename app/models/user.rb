class User < ApplicationRecord
  has_secure_password
  has_one :account, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  PASSWORD_REQUIREMENTS = /\A
    (?=.*\d)         # Must contain at least one digit
    (?=.*[A-Z])      # Must contain at least one uppercase letter
    (?=.*[a-z])      # Must contain at least one lowercase letter
    (?=.*[[:^alnum:]])   # Must contain at least one special character
    .{6,}            # Must be at least 8 characters long
  \z/x

  validates :password, format: PASSWORD_REQUIREMENTS
end

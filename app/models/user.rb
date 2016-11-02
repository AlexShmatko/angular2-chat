class User < ApplicationRecord
  has_secure_password
  has_secure_token

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :password, :password_confirmation,
                        presence: true, confirmation: true, length: { minimum: 6 }, on: :create

  def generate_new_token!
    regenerate_token
    self
  end
end

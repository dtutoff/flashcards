class User < ApplicationRecord
  has_secure_password
  has_many :decks, dependent: :destroy

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
end

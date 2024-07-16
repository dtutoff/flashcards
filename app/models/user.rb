class User < ApplicationRecord
  has_secure_password
  has_many :decks,  dependent: :destroy

  validates :email, presence: true
  validates :name, presence: true, length: { minimum: 2 }
end

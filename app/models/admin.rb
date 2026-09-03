class Admin < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :code, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
end

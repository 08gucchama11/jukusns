class SnsProfile < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :teacher, optional: true
  has_many :posts
  has_many :comments
  has_many :likes

  validates :nickname, presence: true
end

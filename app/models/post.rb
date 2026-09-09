class Post < ApplicationRecord
  belongs_to :sns_profile

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 140 }
end

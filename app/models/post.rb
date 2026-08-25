class Post < ApplicationRecord
  belongs_to :sns_profile

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
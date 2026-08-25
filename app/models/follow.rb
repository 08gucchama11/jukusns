class SnsProfile < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :teacher, optional: true

  has_many :posts
  has_many :comments
  has_many :likes

  has_many :following_relationships, class_name: "Follow", foreign_key: :follower_sns_profile_id
  has_many :follower_relationships, class_name: "Follow", foreign_key: :followed_sns_profile_id
  has_many :following_profiles, through: :following_relationships, source: :followed_sns_profile
  has_many :follower_profiles, through: :follower_relationships, source: :follower_sns_profile
end
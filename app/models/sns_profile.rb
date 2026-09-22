class SnsProfile < ApplicationRecord
  belongs_to :student, optional: true
  belongs_to :teacher, optional: true

  has_many :posts
  has_many :comments
  has_many :likes

  # 自分がいいねした投稿を、likes テーブルを経由して取得する
  has_many :liked_posts,
           through: :likes,
           source: :post

  has_many :following_relationships,
           class_name: "Follow",
           foreign_key: :follower_sns_profile_id
  has_many :follower_relationships,
           class_name: "Follow",
           foreign_key: :followed_sns_profile_id
  has_many :following_profiles,
           through: :following_relationships,
           source: :followed_sns_profile
  has_many :follower_profiles,
           through: :follower_relationships,
           source: :follower_sns_profile

  validates :nickname, presence: true
end

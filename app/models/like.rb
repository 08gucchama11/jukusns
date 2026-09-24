class Like < ApplicationRecord
  belongs_to :post
  belongs_to :sns_profile

  # 同じSNSプロフィールが、同じ投稿へ重複していいねするのを防ぐ
  validates :sns_profile_id, uniqueness: { scope: :post_id }
end

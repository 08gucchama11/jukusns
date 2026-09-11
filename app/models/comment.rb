class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :sns_profile

  validates :body, presence: true, length: { maximum: 140 }
end

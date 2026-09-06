class Follow < ApplicationRecord
  belongs_to :follower_sns_profile, class_name: "SnsProfile"
  belongs_to :followed_sns_profile, class_name: "SnsProfile"

  validates :follower_sns_profile_id,
            uniqueness: { scope: :followed_sns_profile_id }

  validate :cannot_follow_yourself

  private

  def cannot_follow_yourself
    return unless follower_sns_profile_id == followed_sns_profile_id

    errors.add(:followed_sns_profile, "は自分自身を指定できません")
  end
end
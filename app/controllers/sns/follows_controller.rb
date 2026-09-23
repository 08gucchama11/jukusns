class Sns::FollowsController < Sns::ApplicationController
  def index
    @following_profiles = current_sns_profile.following_profiles
    @follower_profiles = current_sns_profile.follower_profiles
  end

  def create
    @sns_profile = SnsProfile.find(params[:profile_id])
    @follow = current_sns_profile.following_relationships.find_or_create_by!(followed_sns_profile: @sns_profile)
    redirect_back fallback_location: sns_root_path
  end

  def destroy
    @sns_profile = SnsProfile.find(params[:profile_id])
    @follow = current_sns_profile.following_relationships.find_by!(followed_sns_profile: @sns_profile)
    @follow.destroy!
    redirect_back fallback_location: sns_root_path
  end
end

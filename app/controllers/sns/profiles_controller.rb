class Sns::ProfilesController < Sns::ApplicationController
  def my_page
    @sns_profile = current_sns_profile
    @posts = @sns_profile.posts.order(created_at: :desc)
  end

  def edit
    @sns_profile = current_sns_profile
  end

  def update
    @sns_profile = current_sns_profile

    if @sns_profile.update(sns_profile_params)
      redirect_to sns_my_page_path, notice: "プロフィールを更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def sns_profile_params
    params.require(:sns_profile).permit(:nickname, :introduction)
  end

end

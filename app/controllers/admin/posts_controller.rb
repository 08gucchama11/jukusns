class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.includes(:sns_profile, :comments).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:sns_profile, comments: :sns_profile).find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to admin_posts_path, notice: "投稿を削除しました。"
    else
      redirect_to admin_posts_path, alert: "投稿を削除できません。"
    end
  end
end
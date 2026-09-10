class Sns::PostsController < Sns::ApplicationController
  def index
    @post = current_sns_profile.posts.new
    @posts = Post.includes(:sns_profile).order(created_at: :desc)
  end

  def create
    @post = current_sns_profile.posts.new(post_params)

    if @post.save
      redirect_to sns_root_path, notice: "投稿に成功しました。"
    else
      @posts = Post.includes(:sns_profile).order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @post = current_sns_profile.posts.find_by(id: params[:id])

    redirect_path = params[:from] == "my_page" ? sns_my_page_path : sns_root_path

    if @post&.destroy
      redirect_to redirect_path, notice: "投稿を削除しました。"
    else
      redirect_to redirect_path, alert: "投稿を削除できません。"
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

end

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
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
  
end

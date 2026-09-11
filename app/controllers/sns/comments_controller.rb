class Sns::CommentsController < Sns::ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_sns_profile.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      redirect_to sns_post_path(@post), notice: "コメントを投稿しました。"
    else
      @comments = @post.comments.includes(:sns_profile).order(created_at: :asc)
      render "sns/posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_sns_profile.comments.find_by( id: params[:id], post_id: @post.id )

    if @comment&.destroy
      redirect_to sns_post_path(@post), notice: "コメントを削除しました。"
    else
      redirect_to sns_post_path(@post), alert: "コメントを削除できません。"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
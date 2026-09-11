class Admin::CommentsController < Admin::ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post

    if @comment.destroy
      redirect_to admin_post_path(post), notice: "コメントを削除しました。"
    else
      redirect_to admin_post_path(post), alert: "コメントを削除できません。"
    end
  end
end
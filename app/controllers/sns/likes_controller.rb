class Sns::LikesController < Sns::ApplicationController
  # いいね一覧機能で使う。今は空のまま残しておく
  def index
  end

  def create
    # URLに含まれる投稿IDから、いいね対象の投稿を取得する
    @post = Post.find(params[:post_id])

    # ログイン中の人のいいねとして作成する。
    # すでにいいね済みなら、重複して作らない
    current_sns_profile.likes.find_or_create_by!(post: @post)

    # いいねを押す直前にいた画面へ戻る
    redirect_back fallback_location: sns_root_path
  end

  def destroy
    # URLに含まれる投稿IDから、いいね対象の投稿を取得する
    @post = Post.find(params[:post_id])

    # ログイン中の人自身が押したいいねだけを取得する
    @like = current_sns_profile.likes.find_by!(post: @post)

    # いいねを解除する
    @like.destroy!

    # いいね解除を押す直前にいた画面へ戻る
    redirect_back fallback_location: sns_root_path
  end
end
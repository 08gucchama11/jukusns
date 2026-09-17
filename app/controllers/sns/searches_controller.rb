class Sns::SearchesController < Sns::ApplicationController
  def search
    # フォームのプルダウンで選んだ検索対象を受け取る
    @target = params[:target]

    # フォームに入力された検索キーワードを受け取る
    @q = params[:q]

    # ユーザー検索の結果を入れる。最初は「0件」にしておく
    @sns_profiles = SnsProfile.none

    # 投稿検索の結果を入れる。最初は「0件」にしておく
    @posts = Post.none

    # 「ニックネーム」が選ばれ、キーワードが入力されている時だけ検索する
    if @target == "profiles" && @q.present?
      # nickname に入力語を含むSNSプロフィールを取り出す
      @sns_profiles = SnsProfile.where("nickname LIKE ?", "%#{@q}%")

    # 「投稿本文」が選ばれ、キーワードが入力されている時だけ検索する
    elsif @target == "posts" && @q.present?
      # 投稿者とコメントも一緒に取得し、本文の部分一致で新しい順に並べる
      @posts = Post.includes(:sns_profile, :comments) .where("body LIKE ?", "%#{@q}%") .order(created_at: :desc)
    end
  end
end

class Admin::SessionsController < Admin::ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to admin_login_url, alert: "Try again later." }

  def new
  end

  def create
    if admin = Admin.authenticate_by(params.permit(:code, :password))
      start_new_session_for admin
      redirect_to after_authentication_url, notice: "ログインに成功しました。"
    else
      redirect_to admin_login_path, alert: "コードまたはパスワードが違います。"
    end
  end

  def destroy
    terminate_session
    redirect_to admin_login_path, notice: "ログアウトに成功しました。"
  end
end

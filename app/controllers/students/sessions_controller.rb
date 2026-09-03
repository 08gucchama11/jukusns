class Students::SessionsController < Students::ApplicationController
  allow_unauthenticated_access only: %i[new create guest_login]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to root_url, alert: "Try again later." }

  def new
  end

  def create
    student = Student.authenticate_by(params.permit(:code, :password))

    if student&.is_active?
      start_new_session_for student
      redirect_to after_authentication_url, notice: "ログインに成功しました。"
    else
      redirect_to root_path, alert: "コードまたはパスワードが違います。"
    end
  end

  def destroy
    terminate_session
    redirect_to root_path
  end

  def guest_login
    guest_student = Student.find_by(code: "guest_student")

    if guest_student&.is_active?
      start_new_session_for guest_student
      redirect_to dashboard_path, notice: "ゲストとしてログインしました。"
    else
      redirect_to root_path, alert: "ゲストログインは現在利用できません。"
    end
  end
end

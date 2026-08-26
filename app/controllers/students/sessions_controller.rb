class Students::SessionsController < Students::ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to root_url, alert: "Try again later." }

  def new
  end

  def create
    if student = Student.authenticate_by(params.permit(:code, :password))
      start_new_session_for student
      redirect_to after_authentication_url
    else
      redirect_to root_path, alert: "コードまたはパスワードが違います。"
    end
  end

  def destroy
    terminate_session
    redirect_to root_path
  end
end

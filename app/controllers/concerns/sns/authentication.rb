module Sns::Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
    helper_method :authenticated?, :current_sns_profile
  end

  private

  def authenticated?
    current_sns_profile.present?
  end

  def current_sns_profile
    resume_session

    if Current.student&.is_active?
      Current.student.sns_profile
    elsif Current.teacher&.is_active?
      Current.teacher.sns_profile
    end
  end

  def require_authentication
    authenticated? || request_authentication
  end

  def resume_session
    Current.session ||= find_session_by_cookie
  end

  def find_session_by_cookie
    Session.find_by(id: cookies.signed[:session_id]) if cookies.signed[:session_id]
  end

  def request_authentication
    if current_active_role?
      redirect_to_current_role_dashboard
    else
      redirect_to root_path, alert: "SNSを利用するにはログインが必要です。"
    end
  end
end
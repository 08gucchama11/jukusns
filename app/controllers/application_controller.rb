class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  private

  def current_active_role?
    Current.admin.present? ||
      Current.teacher&.is_active? ||
      Current.student&.is_active?
  end

  def redirect_to_current_role_dashboard
    if Current.admin.present?
      redirect_to admin_dashboard_path, alert: "権限がありません。"
    elsif Current.teacher&.is_active?
      redirect_to teachers_dashboard_path, alert: "権限がありません。"
    elsif Current.student&.is_active?
      redirect_to dashboard_path, alert: "権限がありません。"
    end
  end
end
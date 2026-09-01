class Students::DashboardsController < Students::ApplicationController
  def index
    @announcements = Announcement.order(created_at: :desc).limit(1)
  end
end

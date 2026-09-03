class Students::AnnouncementsController < Students::ApplicationController
  def index
    @announcements = Announcement.order(created_at: :desc)
  end
end

class Admin::AnnouncementsController < Admin::ApplicationController
  def index
    @announcements = Announcement.order(created_at: :desc)
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      redirect_to admin_announcements_path
    else
      @announcements = Announcement.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :body)
  end
end
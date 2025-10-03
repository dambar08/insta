class Users::NotificationsController < Users::ApplicationController
  # include AutoLayout

  before_action :set_notification, only: [:show, :destroy]

  def index
    @pagy, @notifications = pagy(current_account.notifications.all)
  end

  def show
  end

  def verified
    @pagy, @notifications = pagy(current_account.notifications.all)
  end

  def mentions
    @pagy, @notifications = pagy(current_account.notifications.all)
  end

  def destroy
    @notification.destroy!

    respond_to do |format|
      format.html { redirect_to(notifications_path, status: :see_other, notice: "Notification was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end

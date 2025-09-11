# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :destroy]

  # GET /notifications or /notifications.json
  def index
    @notifications, @pagy = pagy(current_user.notifications.all)
  end

  # GET /notifications/1 or /notifications/1.json
  def show
  end

  # DELETE /notifications/1 or /notifications/1.json
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

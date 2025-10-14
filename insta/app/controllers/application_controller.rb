# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_paper_trail_whodunnit
  after_action :track_action
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  protected

  def track_action
    ahoy.track("Ran action", request.path_parameters)
  end

  private

  def render_not_found
    respond_to do |format|
      format.html { render(file: Rails.public_path.join("404"), layout: false, status: :not_found) }
      format.json { head(:not_found) }
      format.js { render(js: "alert('Resource not found. (404)');", status: :not_found) }
    end
  end

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      users_app_root_path
    elsif resource.is_a?(Admin)
      admins_admin_root_path
    end
  end
end

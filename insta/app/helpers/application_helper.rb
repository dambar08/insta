# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def notification
    flash["notification"]
  end
end

# frozen_string_literal: true

module Weblog
  extend ActiveSupport::Concern
  included do
    before_action :log_request
  end

  private

  def log_request
    logger.info { data_to_log.to_json }
  rescue => e
    ExNotifier.track_exception(e)
  end

  def data_to_log
    request.headers.env.select { |k, _v| k.starts_with?("HTTP_") }
  end
end

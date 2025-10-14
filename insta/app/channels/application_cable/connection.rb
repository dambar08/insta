# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def before_command(command)
      Rails.logger.info "Before command: #{command.inspect}"
    end

    def after_command(command)
      Rails.logger.info "After command: #{command.inspect}"
    end

    def around_command(command)
      start_time = Time.zone.now
      yield
      duration = Time.zone.now - start_time
      Rails.logger.info "Around command: #{command.inspect}"
      Rails.logger.info "Command #{command[:identifier]} took #{duration.round(2)}s"
    end

    def connect
      # current_user || reject_unauthorized_connection
    end
  end
end

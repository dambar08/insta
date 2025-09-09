# frozen_string_literal: true

module Exception
  class Notifier
    class << self
      def track_exception(exception, opts = {})
        if Rails.env.local?
          Rails.logger.error(exception.message)
          Rails.logger.error(exception.backtrace)
        end
        Rails.logger.error("SEND TO YOUR ERROR")
        # Bugsnag.notify(exception) do |notification|
        #   opts.each do |key, value|
        #     notification.add_tab(key.to_sym, value)
        #   end
        #   if exception.respond_to?(:custom_data) && exception.custom_data.present?
        #     notification.add_tab(:custom_data, exception.custom_data)
        #   end
        # end
      end
    end
  end
end

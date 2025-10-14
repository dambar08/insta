module Notifications
  module AccountVerification
    class Send
      def self.call(...)
        new(...).call
      end

      delegate :user_data, to: Notifications

      attr_reader :verification_request

      def initialize(verification_request)
        @verification_request = verification_request
      end

      def call
        Notification.find_or_create_by(verification_request)
      end
    end
  end
end

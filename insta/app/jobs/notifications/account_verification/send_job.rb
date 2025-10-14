class Notifications::AccountVerification::SendJob < ApplicationJob
  queue_as :default

  def perform(verification_request_id)
    verification_request = VerificationRequest.find_by(verification_request_id)
    return if verification_request.blank?

    Notifications::AccountVerification::Send.call(verification_request)
  end
end

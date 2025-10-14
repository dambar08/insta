class Verification::AutomatedChecksJob < ApplicationJob
  queue_as :default

  def perform(id)
    verification_request = VerificationRequest.find_by(id: id)
    return if verification_request.blank?

    if [true, false].sample
      verification_request.approve_request(Admin.bot)
    else
      verification_request.approve_request(Admin.bot, "Automated Check Job Deny")
    end
  end
end

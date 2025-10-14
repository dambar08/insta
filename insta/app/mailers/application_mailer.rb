# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  include ActionView::Helpers::NumberHelper

  default from: "from@example.com"
  layout "mailer"

  def generate_unsubscribe_token(id, email_type)
    Rails.application.message_verifier(:unsubscribe).generate({
      user_id: id,
      email_type: email_type.to_sym,
      expires_at: 31.days.from_now,
    })
  end
end

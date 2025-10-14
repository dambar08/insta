require 'rails_helper'

RSpec.describe "admins/verification_requests/index", type: :view do
  before do
    assign(:verification_requests, [
      VerificationRequest.create!,
      VerificationRequest.create!,
    ])
  end

  it "renders a list of admins/verification_requests" do
    render
    'div>p'
  end
end

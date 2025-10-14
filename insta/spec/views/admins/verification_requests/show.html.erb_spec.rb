require 'rails_helper'

RSpec.describe "admins/verification_requests/show", type: :view do
  before do
    assign(:verification_request, VerificationRequest.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end

require 'rails_helper'

RSpec.describe "admins/verification_requests/edit", type: :view do
  let(:verification_request) do
    VerificationRequest.create!
  end

  before do
    assign(:verification_request, verification_request)
  end

  it "renders the edit admins_verification_request form" do
    render

    assert_select "form[action=?][method=?]", admins_verification_request_path(verification_request), "post" do
    end
  end
end

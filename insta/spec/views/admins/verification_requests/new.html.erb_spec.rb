require 'rails_helper'

RSpec.describe "admins/verification_requests/new", type: :view do
  before do
    assign(:verification_request, VerificationRequest.new)
  end

  it "renders new admins_verification_request form" do
    render

    assert_select "form[action=?][method=?]", admins_verification_requests_path, "post" do
    end
  end
end

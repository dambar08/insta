require 'rails_helper'

RSpec.describe "admins/users/edit", type: :view do
  let(:admins_user) {
    Admins::User.create!()
  }

  before(:each) do
    assign(:admins_user, admins_user)
  end

  it "renders the edit admins_user form" do
    render

    assert_select "form[action=?][method=?]", admins_user_path(admins_user), "post" do
    end
  end
end

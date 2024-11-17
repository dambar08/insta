require 'rails_helper'

RSpec.describe "admins/users/new", type: :view do
  before(:each) do
    assign(:admins_user, Admins::User.new())
  end

  it "renders new admins_user form" do
    render

    assert_select "form[action=?][method=?]", admins_users_path, "post" do
    end
  end
end

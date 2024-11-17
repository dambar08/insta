require 'rails_helper'

RSpec.describe "admins/users/show", type: :view do
  before(:each) do
    assign(:admins_user, Admins::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

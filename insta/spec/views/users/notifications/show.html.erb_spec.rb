require 'rails_helper'

RSpec.describe "users/notifications/show", type: :view do
  before(:each) do
    assign(:notification, Notification.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

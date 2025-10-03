require 'rails_helper'

RSpec.describe "users/notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new())
  end

  it "renders new users_notification form" do
    render

    assert_select "form[action=?][method=?]", users_notifications_path, "post" do
    end
  end
end

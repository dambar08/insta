require 'rails_helper'

RSpec.describe "users/notifications/edit", type: :view do
  let(:notification) {
    Notification.create!()
  }

  before(:each) do
    assign(:notification, notification)
  end

  it "renders the edit users_notification form" do
    render

    assert_select "form[action=?][method=?]", users_notification_path(notification), "post" do
    end
  end
end

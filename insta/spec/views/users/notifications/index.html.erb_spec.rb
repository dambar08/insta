require 'rails_helper'

RSpec.describe "users/notifications/index", type: :view do
  before do
    assign(:notifications, [
      Notification.create!,
      Notification.create!,
    ])
  end

  it "renders a list of users/notifications" do
    render
    'div>p'
  end
end

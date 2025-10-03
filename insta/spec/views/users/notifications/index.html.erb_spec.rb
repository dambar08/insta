require 'rails_helper'

RSpec.describe "users/notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(),
      Notification.create!()
    ])
  end

  it "renders a list of users/notifications" do
    render
    cell_selector = 'div>p'
  end
end

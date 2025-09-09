# frozen_string_literal: true

require "rails_helper"

RSpec.describe("admins/users/index", type: :view) do
  before do
    assign(:admins_users, [
      Admins::User.create!,
      Admins::User.create!,
    ])
  end

  it "renders a list of admins/users" do
    render
    Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
  end
end

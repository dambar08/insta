# frozen_string_literal: true

require "rails_helper"

RSpec.describe("users/index", type: :view) do
  before do
    assign(:users, [
      User.create!,
      User.create!,
    ])
  end

  it "renders a list of users" do
    render
    Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
  end
end

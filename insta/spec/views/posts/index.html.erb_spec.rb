# frozen_string_literal: true

require "rails_helper"

RSpec.describe("posts/index", type: :view) do
  before do
    assign(:posts, [
      Post.create!,
      Post.create!,
    ])
  end

  it "renders a list of posts" do
    render
    Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
  end
end

require 'rails_helper'

RSpec.describe "users/comments/index", type: :view do
  before do
    assign(:comments, [
      Comment.create!,
      Comment.create!,
    ])
  end

  it "renders a list of users/comments" do
    render
    'div>p'
  end
end

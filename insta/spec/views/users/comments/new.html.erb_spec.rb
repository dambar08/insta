require 'rails_helper'

RSpec.describe "users/comments/new", type: :view do
  before do
    assign(:comment, Comment.new)
  end

  it "renders new users_comment form" do
    render

    assert_select "form[action=?][method=?]", users_comments_path, "post" do
    end
  end
end

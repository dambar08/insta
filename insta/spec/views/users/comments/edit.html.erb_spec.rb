require 'rails_helper'

RSpec.describe "users/comments/edit", type: :view do
  let(:comment) do
    Comment.create!
  end

  before do
    assign(:comment, comment)
  end

  it "renders the edit users_comment form" do
    render

    assert_select "form[action=?][method=?]", users_comment_path(comment), "post" do
    end
  end
end

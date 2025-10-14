require 'rails_helper'

RSpec.describe "users/bookmarks/new", type: :view do
  before do
    assign(:bookmark, Bookmark.new)
  end

  it "renders new users_bookmark form" do
    render

    assert_select "form[action=?][method=?]", users_bookmarks_path, "post" do
    end
  end
end

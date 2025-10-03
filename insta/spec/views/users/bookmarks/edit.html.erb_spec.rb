require 'rails_helper'

RSpec.describe "users/bookmarks/edit", type: :view do
  let(:bookmark) {
    Bookmark.create!()
  }

  before(:each) do
    assign(:bookmark, bookmark)
  end

  it "renders the edit users_bookmark form" do
    render

    assert_select "form[action=?][method=?]", users_bookmark_path(bookmark), "post" do
    end
  end
end

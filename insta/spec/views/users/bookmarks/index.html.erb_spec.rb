require 'rails_helper'

RSpec.describe "users/bookmarks/index", type: :view do
  before(:each) do
    assign(:bookmarks, [
      Bookmark.create!(),
      Bookmark.create!()
    ])
  end

  it "renders a list of users/bookmarks" do
    render
    cell_selector = 'div>p'
  end
end

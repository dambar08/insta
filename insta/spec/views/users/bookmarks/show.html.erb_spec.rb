require 'rails_helper'

RSpec.describe "users/bookmarks/show", type: :view do
  before do
    assign(:bookmark, Bookmark.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end

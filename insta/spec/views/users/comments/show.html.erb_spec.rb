require 'rails_helper'

RSpec.describe "users/comments/show", type: :view do
  before do
    assign(:comment, Comment.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end

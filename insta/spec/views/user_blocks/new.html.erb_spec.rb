require 'rails_helper'

RSpec.describe "user_blocks/new", type: :view do
  before(:each) do
    assign(:user_block, UserBlock.new())
  end

  it "renders new user_block form" do
    render

    assert_select "form[action=?][method=?]", user_blocks_path, "post" do
    end
  end
end

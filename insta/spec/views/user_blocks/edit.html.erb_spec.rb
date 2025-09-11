require 'rails_helper'

RSpec.describe "user_blocks/edit", type: :view do
  let(:user_block) {
    UserBlock.create!()
  }

  before(:each) do
    assign(:user_block, user_block)
  end

  it "renders the edit user_block form" do
    render

    assert_select "form[action=?][method=?]", user_block_path(user_block), "post" do
    end
  end
end

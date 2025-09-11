require 'rails_helper'

RSpec.describe "user_blocks/index", type: :view do
  before(:each) do
    assign(:user_blocks, [
      UserBlock.create!(),
      UserBlock.create!()
    ])
  end

  it "renders a list of user_blocks" do
    render
    cell_selector = 'div>p'
  end
end

require 'rails_helper'

RSpec.describe "user_blocks/show", type: :view do
  before(:each) do
    assign(:user_block, UserBlock.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

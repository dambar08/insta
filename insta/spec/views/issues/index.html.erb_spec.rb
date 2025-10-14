require 'rails_helper'

RSpec.describe "issues/index", type: :view do
  before do
    assign(:issues, [
      Issue.create!(
        description: "MyText",
      ),
      Issue.create!(
        description: "MyText",
      ),
    ])
  end

  it "renders a list of issues" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end

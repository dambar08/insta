require 'rails_helper'

RSpec.describe "issues/show", type: :view do
  before do
    assign(:issue, Issue.create!(
      description: "MyText",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end

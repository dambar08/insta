require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  let(:issue) do
    Issue.create!(
      description: "MyText",
    )
  end

  before do
    assign(:issue, issue)
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(issue), "post" do
      assert_select "textarea[name=?]", "issue[description]"
    end
  end
end

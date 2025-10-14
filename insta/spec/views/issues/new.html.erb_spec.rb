require 'rails_helper'

RSpec.describe "issues/new", type: :view do
  before do
    assign(:issue, Issue.new(
      description: "MyText",
    ))
  end

  it "renders new issue form" do
    render

    assert_select "form[action=?][method=?]", issues_path, "post" do
      assert_select "textarea[name=?]", "issue[description]"
    end
  end
end

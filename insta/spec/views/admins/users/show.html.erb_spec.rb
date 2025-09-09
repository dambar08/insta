# frozen_string_literal: true

require "rails_helper"

RSpec.describe("admins/users/show", type: :view) do
  before do
    assign(:admins_user, Admins::User.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end

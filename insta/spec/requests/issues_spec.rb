require 'rails_helper'

RSpec.describe "/issues", type: :request do
  let(:valid_attributes) { attributes_for(:issue) }
  let(:invalid_attributes) { { description: "" } }

  let(:new_attributes) { { description: "Updated issue", status: "in_progress" } }

  describe "GET /new" do
    it "renders a successful response" do
      get new_issue_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Issue" do
        expect do
          post issues_url, params: { issue: valid_attributes }
        end.to change(Issue, :count).by(1)
      end

      it "redirects to the created issue" do
        post issues_url, params: { issue: valid_attributes }
        expect(response).to redirect_to(issue_url(Issue.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Issue" do
        expect do
          post issues_url, params: { issue: invalid_attributes }
        end.not_to change(Issue, :count)
      end

      it "renders a response with 422 status" do
        post issues_url, params: { issue: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

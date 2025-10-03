require 'rails_helper'

RSpec.describe "/user_blocks", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # UserBlock. As you add validations to UserBlock, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserBlock.create! valid_attributes
      get user_blocks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_block = UserBlock.create! valid_attributes
      get user_block_url(user_block)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_block_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user_block = UserBlock.create! valid_attributes
      get edit_user_block_url(user_block)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserBlock" do
        expect {
          post user_blocks_url, params: { user_block: valid_attributes }
        }.to change(UserBlock, :count).by(1)
      end

      it "redirects to the created user_block" do
        post user_blocks_url, params: { user_block: valid_attributes }
        expect(response).to redirect_to(user_block_url(UserBlock.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserBlock" do
        expect {
          post user_blocks_url, params: { user_block: invalid_attributes }
        }.to change(UserBlock, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_blocks_url, params: { user_block: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_block" do
        user_block = UserBlock.create! valid_attributes
        patch user_block_url(user_block), params: { user_block: new_attributes }
        user_block.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_block" do
        user_block = UserBlock.create! valid_attributes
        patch user_block_url(user_block), params: { user_block: new_attributes }
        user_block.reload
        expect(response).to redirect_to(user_block_url(user_block))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user_block = UserBlock.create! valid_attributes
        patch user_block_url(user_block), params: { user_block: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_block" do
      user_block = UserBlock.create! valid_attributes
      expect {
        delete user_block_url(user_block)
      }.to change(UserBlock, :count).by(-1)
    end

    it "redirects to the user_blocks list" do
      user_block = UserBlock.create! valid_attributes
      delete user_block_url(user_block)
      expect(response).to redirect_to(user_blocks_url)
    end
  end
end

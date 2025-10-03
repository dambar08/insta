require 'rails_helper'

RSpec.describe "/notifications", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Notification. As you add validations to Notification, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip("Add a hash of attributes valid for your model")
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  describe "GET /index" do
    it "renders a successful response" do
      Notification.create! valid_attributes
      get users_notifications_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      notification = Notification.create! valid_attributes
      get users_notification_url(notification)
      expect(response).to be_successful
    end
  end

  describe "GET /verified" do
    it "renders a successful response" do
      get verified_users_notifications_url
      expect(response).to be_successful
    end
  end

  describe "GET /mentions" do
    it "renders a successful response" do
      get mentions_users_notifications_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_users_notification_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      notification = Notification.create! valid_attributes
      get edit_users_notification_url(notification)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Notification" do
        expect do
          post users_notifications_url, params: { notification: valid_attributes }
        end.to change(Notification, :count).by(1)
      end

      it "redirects to the created notification" do
        post users_notifications_url, params: { notification: valid_attributes }
        expect(response).to redirect_to(users_notification_url(Notification.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Notification" do
        expect do
          post users_notifications_url, params: { notification: invalid_attributes }
        end.not_to change(Notification, :count)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post users_notifications_url, params: { notification: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested notification" do
        notification = Notification.create! valid_attributes
        patch users_notification_url(notification), params: { notification: new_attributes }
        notification.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the notification" do
        notification = Notification.create! valid_attributes
        patch users_notification_url(notification), params: { notification: new_attributes }
        notification.reload
        expect(response).to redirect_to(notification_url(notification))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        notification = Notification.create! valid_attributes
        patch users_notification_url(notification), params: { notification: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested notification" do
      notification = Notification.create! valid_attributes
      expect do
        delete users_notification_url(notification)
      end.to change(Notification, :count).by(-1)
    end

    it "redirects to the notifications list" do
      notification = Notification.create! valid_attributes
      delete users_notification_url(notification)
      expect(response).to redirect_to(users_notifications_url)
    end
  end
end

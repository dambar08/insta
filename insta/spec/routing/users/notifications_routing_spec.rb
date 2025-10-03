require "rails_helper"

RSpec.describe Users::NotificationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/notifications").to route_to("users/notifications#index")
    end

    it "routes to #new" do
      expect(get: "/users/notifications/new").to route_to("users/notifications#new")
    end

    it "routes to #show" do
      expect(get: "/users/notifications/1").to route_to("users/notifications#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/notifications/1/edit").to route_to("users/notifications#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/users/notifications").to route_to("users/notifications#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/notifications/1").to route_to("users/notifications#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/notifications/1").to route_to("users/notifications#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/notifications/1").to route_to("users/notifications#destroy", id: "1")
    end
  end
end

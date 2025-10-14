require "rails_helper"

RSpec.describe Admins::VerificationRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admins/verification_requests").to route_to("admins/verification_requests#index")
    end

    it "routes to #new" do
      expect(get: "/admins/verification_requests/new").to route_to("admins/verification_requests#new")
    end

    it "routes to #show" do
      expect(get: "/admins/verification_requests/1").to route_to("admins/verification_requests#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admins/verification_requests/1/edit").to route_to("admins/verification_requests#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/admins/verification_requests").to route_to("admins/verification_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admins/verification_requests/1").to route_to("admins/verification_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admins/verification_requests/1").to route_to("admins/verification_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admins/verification_requests/1").to route_to("admins/verification_requests#destroy", id: "1")
    end
  end
end

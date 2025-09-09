# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Admins::UsersController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admins/users").to(route_to("admins/users#index"))
    end

    it "routes to #new" do
      expect(get: "/admins/users/new").to(route_to("admins/users#new"))
    end

    it "routes to #show" do
      expect(get: "/admins/users/1").to(route_to("admins/users#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/admins/users/1/edit").to(route_to("admins/users#edit", id: "1"))
    end

    it "routes to #create" do
      expect(post: "/admins/users").to(route_to("admins/users#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/admins/users/1").to(route_to("admins/users#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admins/users/1").to(route_to("admins/users#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/admins/users/1").to(route_to("admins/users#destroy", id: "1"))
    end
  end
end

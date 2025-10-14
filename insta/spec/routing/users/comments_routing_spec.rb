require "rails_helper"

RSpec.describe Users::CommentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/comments").to route_to("users/comments#index")
    end

    it "routes to #new" do
      expect(get: "/users/comments/new").to route_to("users/comments#new")
    end

    it "routes to #show" do
      expect(get: "/users/comments/1").to route_to("users/comments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/comments/1/edit").to route_to("users/comments#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/users/comments").to route_to("users/comments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/comments/1").to route_to("users/comments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/comments/1").to route_to("users/comments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/comments/1").to route_to("users/comments#destroy", id: "1")
    end
  end
end

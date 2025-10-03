require "rails_helper"

RSpec.describe Users::BookmarksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/bookmarks").to route_to("users/bookmarks#index")
    end

    it "routes to #new" do
      expect(get: "/users/bookmarks/new").to route_to("users/bookmarks#new")
    end

    it "routes to #show" do
      expect(get: "/users/bookmarks/1").to route_to("users/bookmarks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/bookmarks/1/edit").to route_to("users/bookmarks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/users/bookmarks").to route_to("users/bookmarks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/bookmarks/1").to route_to("users/bookmarks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/bookmarks/1").to route_to("users/bookmarks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/bookmarks/1").to route_to("users/bookmarks#destroy", id: "1")
    end
  end
end

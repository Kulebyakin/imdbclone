require "rails_helper"

RSpec.describe MoviesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/movies").to route_to("movies#index")
    end

    it "routes to #show" do
      expect(get: "/movies/1").to route_to("movies#show", id: "1")
    end

    it "routes to #category" do
      expect(get: "/category/comedy").to route_to("movies#category", category: "comedy")
    end
  end
end

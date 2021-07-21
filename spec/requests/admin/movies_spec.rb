require 'rails_helper'

RSpec.describe "Admin::Movies", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/movies/index"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /new" do
  #   it "returns http success" do
  #     get "/admin/movies/new"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/admin/movies/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /edit" do
  #   it "returns http success" do
  #     get "/admin/movies/edit"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/admin/movies/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/admin/movies/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

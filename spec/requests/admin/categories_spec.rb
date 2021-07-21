require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  
  admin = FactoryBot.build(:admin_user, username: 'usr', email: 'usr@test.com')

  let(:valid_attributes) do 
    {
      title: 'Comedy'
    }
  end

  let(:invalid_attributes) do 
    {
      title: ''
    }
  end

  describe "GET /index" do
    it "returns http success" do
      category = Category.new(valid_attributes)
      category.save
      get "/admin/categories"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/categories/new"
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get "/admin/categories/create"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET /edit" do
    it "returns http success" do
      category = Category.new(valid_attributes)
      category.save
      get edit_admin_category_url(category)
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /update" do
  #   it "returns http success" do
  #     get "/admin/categories/update"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     get "/admin/categories/destroy"
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end

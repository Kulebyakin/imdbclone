# require 'rails_helper'

# RSpec.describe "Admin::Movies", type: :request do
#   admin = FactoryBot.build(:admin_user, username: 'usr', email: 'usr@test.com')
#   category = Category.first_or_create!(title: 'Comedy')
#   login_admin

#   let(:valid_attributes) do 
#     {
#       :title => 'Title',
#       :category_ids => category.id
#     }
#   end

#   let(:invalid_attributes) do 
#     {
#       :title => '',
#       :category_ids => category
#     }
#   end

#   describe "GET /index" do
#     it "renders a successful response" do
#       # login_admin
#       @movies = Movie.create! valid_attributes
#       get admin_movies_url
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET /new" do
#     it "renders a successful response" do
#       Movie.create! valid_attributes
#       get new_admin_movie_url
#       expect(response).to have_http_status(:success)
#     end
#   end

#   # describe "GET /create" do
#   #   it "returns http success" do
#   #     get "/admin/movies/create"
#   #     expect(response).to have_http_status(:success)
#   #   end
#   # end

#   describe "GET /edit" do
#     it "renders a successful response" do
#       movie = Movie.create! valid_attributes
#       get edit_admin_movie_url(movie)
#       expect(response).to have_http_status(:success)
#     end
#   end

#   # describe "GET /update" do
#   #   it "returns http success" do
#   #     get "/admin/movies/update"
#   #     expect(response).to have_http_status(:success)
#   #   end
#   # end

#   # describe "GET /destroy" do
#   #   it "returns http success" do
#   #     get "/admin/movies/destroy"
#   #     expect(response).to have_http_status(:success)
#   #   end
#   # end

# end

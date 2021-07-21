require 'rails_helper'

RSpec.describe "admin/movies/new.html.erb", type: :view do
  admin = FactoryBot.build(:admin_user, username: 'usr', email: 'usr@test.com')
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    @movie = assign(:movie, Movie.create!(
      title: 'A valid title',
      description: 'A valid description',
      category_ids: category.id))
  end

  it "renders the new movie form" do
    render 

    assert_select "form[action=?][method=?]", admin_movie_path(@movie), "post" do
      
    end
  end
end

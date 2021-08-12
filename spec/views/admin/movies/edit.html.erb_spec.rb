require 'rails_helper'

RSpec.describe "admin/movies/edit.html.erb", type: :view do
  # user = FactoryBot.build(:user, username: 'qwe', email: 'qwe@test.com')
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    @movie = assign(:movie, Movie.create!(
      title: 'A valid title',
      description: 'A valid description',
      category_ids: category.id))
  end

  it "renders the edit movie form" do
    render 

    assert_select "form[action=?][method=?]", admin_movie_path(@movie), "post" do
    end
  end
end

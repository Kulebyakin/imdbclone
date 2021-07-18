require 'rails_helper'

RSpec.describe "admin/movies/create.html.erb", type: :view do
  admin = User.first_or_create!(username: 'usr', email: 'usr@test.com', password: '123qwe', password_confirmation: '123qwe', admin: true)
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    allow(view).to receive(:current_user).and_return(admin)
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

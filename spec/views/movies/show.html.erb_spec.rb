require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    @movie = assign(:movie, Movie.create!(
                title: 'A valid title',
                description: 'A valid description',
                category_ids: category.id
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end

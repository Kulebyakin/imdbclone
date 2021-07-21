require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  # login_user
  before do
    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
  end
  
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

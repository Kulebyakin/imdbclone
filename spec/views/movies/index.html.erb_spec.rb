require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  user = User.first_or_create!(username: 'usr', email: 'usr@test.com', password: '123qwe', password_confirmation: '123qwe')
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    allow(view).to receive(:current_user).and_return(user)
    assign(:movies, [
              Movie.create!(
                title: 'A valid title',
                description: 'A valid description',
                category_ids: category.id
              ),
              Movie.create!(
                title: 'A valid title',
                description: 'A valid description',
                category_ids: category.id
              )
            ])
  end

  it "renders a list of movies" do
    render
    assert_select 'h3', text: 'A valid title', count: 2
    assert_select 'p.fs-5', text: 'A valid description', count: 2
    assert_select 'a', text: category.title, count: 2
  end
end

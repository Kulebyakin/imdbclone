require 'rails_helper'

RSpec.describe "admin/movies/index.html.erb", type: :view do
  user = FactoryBot.build(:user, username: 'qwe', email: 'qwe@test.com')
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
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
    assert_select 'tr>td', text: 'A valid title', count: 2
    assert_select 'tr>td', text: 'A valid description', count: 2
    assert_select 'tr>td', text: category.title, count: 2
  end
end

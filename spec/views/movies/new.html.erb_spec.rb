require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  admin = User.first_or_create!(username: 'usr', email: 'usr@test.com', password: '123qwe', password_confirmation: '123qwe', admin: true)
  category = Category.first_or_create!(title: 'Comedy')

  before(:each) do
    allow(view).to receive(:current_user).and_return(admin)
    assign(:movie, Movie.new(
      title: 'A valid title',
      description: 'A valid description',
      category_ids: category.id
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do
    end
  end
end

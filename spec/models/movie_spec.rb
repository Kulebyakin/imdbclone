require 'rails_helper'

RSpec.describe Movie, type: :model do
  current_user = User.first_or_create!(username: 'usr', email: 'usr@test.com', password: '123qwe', password_confirmation: '123qwe')
  category = Category.first_or_create!(title: 'Comedy')

  it 'Has a title' do
    movie = Movie.new(
      title: '',
      description: 'A description',
      category_ids: category.id
    )
    expect(movie).to_not be_valid

    movie.title = 'title'
    expect(movie).to be_valid
  end

  
  it 'Has a category' do
    movie = Movie.new(
      title: 'Title',
      description: 'A description',
      category_ids: ''
    )

    expect(movie).to_not be_valid
    movie.category_ids = category.id
    expect(movie).to be_valid
  end
end

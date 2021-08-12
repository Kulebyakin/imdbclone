require 'rails_helper'

RSpec.describe "admin/categories/index.html.erb", type: :view do
  # user = FactoryBot.build(:user, username: 'qwe2', email: 'qwe2@test.com')

  before(:each) do
    assign(:categories, [
              Category.create!(
                title: 'Comedy'
              ),
              Category.create!(
                title: 'Drama'
              )
            ])
  end

  it "renders a list of categories" do
    render
    assert_select 'tr>td', text: 'Comedy', count: 1
    assert_select 'tr>td', text: 'Drama', count: 1
  end
end

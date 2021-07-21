require 'rails_helper'

RSpec.describe "admin/categories/new.html.erb", type: :view do
  admin = FactoryBot.build(:admin_user, username: 'usr', email: 'usr@test.com')

  before(:each) do
    @category = assign(:categories, Category.create!(
      title: 'Comedy'
      ))
  end

  it "renders the new category form" do
    render 

    assert_select "form[action=?][method=?]", admin_category_path(@category), "post" do
    end
  end
end

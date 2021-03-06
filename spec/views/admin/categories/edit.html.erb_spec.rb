require 'rails_helper'

RSpec.describe "admin/categories/edit.html.erb", type: :view do
  # user = FactoryBot.build(:user, username: 'qwe', email: 'qwe@test.com')

  before(:each) do
    @category = assign(:category, Category.create!(
          title: 'Comedy'))
  end

  it "renders the edit category form" do
    render 

    assert_select "form[action=?][method=?]", admin_category_path(@category), "post" do
    end
  end
end

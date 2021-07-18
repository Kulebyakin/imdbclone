require 'rails_helper'

RSpec.describe "admin/categories/edit.html.erb", type: :view do
  admin = User.first_or_create!(username: 'usr', email: 'usr@test.com', password: '123qwe', password_confirmation: '123qwe', admin: true)

  before(:each) do
    allow(view).to receive(:current_user).and_return(admin)
    @category = assign(:category, Category.create!(title: 'title'))
  end

  it "renders the edit movie form" do
    render 

    assert_select "form[action=?][method=?]", edit_admin_category_path(@category), "post" do
    end
  end
end

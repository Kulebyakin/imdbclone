require 'rails_helper'

RSpec.describe "admin/users/index.html.erb", type: :view do
  # users = FactoryBot.build(:user, username: 'user', email: 'user@test.com')

  before(:each) do
    assign(:users, [
              User.create!(
                username: 'user', 
                email: 'user@test.com',
                password: '123qwe',
                password_confirmation: '123qwe'
              ),
              User.create!(
                username: 'user2', 
                email: 'user2@test.com',
                password: '123qwe',
                password_confirmation: '123qwe'
              ),
              User.create!(
                username: 'user3', 
                email: 'user3@test.com',
                password: '123qwe',
                password_confirmation: '123qwe'
              ),
              User.create!(
                username: 'user4', 
                email: 'user4@test.com',
                password: '123qwe',
                password_confirmation: '123qwe'
              )
            ])
  end

  it "renders a list of categories" do
    render
    assert_select 'tr>td', text: /user\d?@test.com/, count: 4
    assert_select 'tr>td', text: /user\d?$/, count: 4
  end
end

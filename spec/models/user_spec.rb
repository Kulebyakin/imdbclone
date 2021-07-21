require 'rails_helper'

RSpec.describe User, type: :model do
  it 'returns username and email for a user' do
    user = create(:user, username: 'ASmith', email: 'asmith49@test.com')
    
    expect(user.username).to eq 'ASmith'
    expect(user.email).to eq 'asmith49@test.com'

    admin_user = create(:admin_user, username: 'admin_smith', email: 'admin_smith@test.com')

    expect(admin_user.admin).to eq true
  end
end

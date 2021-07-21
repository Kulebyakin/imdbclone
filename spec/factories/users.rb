FactoryBot.define do
  factory :user do
    username { "User" }
    email { "user@test.com" }
    password { "strongpass" }
    
    trait :admin do
      admin { true }
    end

    factory :admin_user, traits: [:admin]
  end
end

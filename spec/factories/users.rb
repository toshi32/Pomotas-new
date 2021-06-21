FactoryBot.define do
  factory :user do
    name { "test_user1" }
    email { "user1@example.com" }
    password { "5555555" }
    password_confirmation { "5555555" }
  end
end

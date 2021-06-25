FactoryBot.define do
  factory :user do
    name { "user1" }
    email { "user1@example.com" }
    password { "password1" }
    password_confirmation { "password1" }
    admin { true }
  end
  factory :user2, class: "User" do
    name { "user2" }
    email { "user2@example.com" }
    password { "password2" }
    password_confirmation { "password2" }
    admin { false }
  end
end

FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name { "user" }
    role { :mentor }
    password { "Testpassword1!" }

    sequence(:email) { |n| "user#{n}@example.com" }
  end

  factory :mentee, class: "User" do
    first_name { "Test" }
    last_name { "user" }
    role { :mentee }
    password { "Testpassword1!" }

    sequence(:email) { |n| "mentee#{n}@example.com"}
  end

end

FactoryBot.define do
  factory :comment do
    message { "MyText" }
    user_challenge { association :user_challenge }
    user { association :user }
  end
end

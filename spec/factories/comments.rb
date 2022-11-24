FactoryBot.define do
  factory :comment do
    message { "MyText" }
    user_challenge { nil }
  end
end

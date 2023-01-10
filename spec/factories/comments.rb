FactoryBot.define do
  factory :comment do
    message { "MyText" }
    user { create(:user) }
    user_challenge { create(:user_challenge, user: user) }
  end
end

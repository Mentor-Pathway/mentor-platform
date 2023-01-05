FactoryBot.define do
  factory :comment do
    message { "MyText" }
    user_challenge { create(:user_challenge) }
    user { create(:user) }
  end
end

FactoryBot.define do
  factory :user_challenge do
    challenge { association :challenge }
    user { association :user }
  end
end

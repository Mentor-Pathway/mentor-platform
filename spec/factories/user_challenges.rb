FactoryBot.define do
  factory :user_challenge do
    challenge_id { Challenge.last.id }
    user_id { User.last.id }
  end
end

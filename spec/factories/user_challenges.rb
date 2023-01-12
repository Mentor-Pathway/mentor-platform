FactoryBot.define do
  factory :user_challenge do
    challenge { create(:challenge) }
    user_pathway { create(:user_pathway) }
  end
end

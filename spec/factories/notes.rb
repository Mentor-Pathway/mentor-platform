FactoryBot.define do
  factory :note do
    user_challenge { association :user_challenge }
    note { "Test Note" }
  end
end

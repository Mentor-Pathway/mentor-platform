FactoryBot.define do
  factory :note do
    user_challenge { nil }
    note { "MyText" }
  end
end

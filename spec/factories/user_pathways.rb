FactoryBot.define do
  factory :user_pathway do
    user { association :user }
    pathway { association :pathway }
  end
end

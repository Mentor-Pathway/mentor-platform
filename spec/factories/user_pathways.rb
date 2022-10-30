FactoryBot.define do
  factory :user_pathway do
    user { association :user }
  end
end

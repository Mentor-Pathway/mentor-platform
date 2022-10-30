FactoryBot.define do
  factory :profile do
    job { "Devops egineers" }
    user { association :user }
  end
end

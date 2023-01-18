FactoryBot.define do
  factory :tagging do
   tag { association :tag }
   pathway { association :pathway }
  end
end

FactoryBot.define do
  factory :path_challenge do
    pathway { association :pathway }
    challenge { association :challenge }
  end
end

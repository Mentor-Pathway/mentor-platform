FactoryBot.define do
  factory :path_challenge do
    pathway_id { Pathway.last.id }
    challenge_id { Challenge.last.id }
  end
end

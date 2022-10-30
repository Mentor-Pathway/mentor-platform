FactoryBot.define do
  factory :user_pathway do
    user_id { User.last.id }
  end
end

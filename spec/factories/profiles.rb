FactoryBot.define do
  factory :profile do
    user { association :user }
    job { "Devops egineers" }
    bio { "Ever since I was a little child, I've dreamt of being a DevOps Engineer. I'm still dreaming!" }
    linkedin { "linkedin.com/in/boris-johnson" }
    github { "github.com/torvalds" }
  end
end

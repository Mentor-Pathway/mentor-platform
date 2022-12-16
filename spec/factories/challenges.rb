FactoryBot.define do
  factory :challenge do
    user { association :user }
    title { "Beginner Task One" }
    details { "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat." }
  end
end

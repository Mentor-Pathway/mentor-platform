UserChallenge.destroy_all
UserPathway.destroy_all
Challenge.destroy_all
Pathway.destroy_all
User.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"

@mentor = User.create!(
  first_name: "Mentor", last_name: "Test", email: "mentor@test.com", password: "Testpassword1!", role: "mentor"
)

@mentee = User.create!(
  first_name: "Mentee", last_name: "Test", email: "mentee@test.com", password: "Testpassword1!", role: "mentee"
)

User.create!(
  first_name: "Mentor", last_name: "Fresh", email: "mentor@fresh.com", password: "Testpassword1!", role: "mentor"
)

User.create!(
  first_name: "Mentee", last_name: "Fresh", email: "mentee@fresh.com", password: "Testpassword1!", role: "mentee"
)

@mentee.profile.update!(
  job: "Devops Enginner",
  bio: "Ever since I was a little child, I've dreamt of being a DevOps Engineer. I'm still dreaming!",
  linkedin: "linkedin.com/in/boris-johnson",
  github: "www.github.com/torvalds"
)

level = ["beginner", "intermediate", "advanced"]

def CreateChallenge(i)
  Challenge.create!(
    title: "Challenge #{i + 1}!",
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    user_id: @mentor.id
  )

  PathChallenge.create!(
    challenge_id: Challenge.last.id,
    pathway_id: Pathway.last.id,
    order: i
  )
end

5.times do |i|
  level_choice = rand(0..2)
  Pathway.create!(
    user_id: @mentor.id,
    title: "Pathways, #{i + 1}!",
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. #{i + 1}!",
    difficulty: level[level_choice]
  )

  20.times do |i|
    CreateChallenge(i)
  end
end

puts "Create User Pathway"
UserPathway.create!(user: @mentee, pathway: Pathway.last)

puts "Update User Challenge objects"
UserChallenge.all.each do |challenge|
  UserChallenge.update!(
    user_id: @mentee.id, rating: 5, completed: false
  )
end

puts "created #{User.count} users"
puts "created #{Pathway.count} pathways"
puts "Created #{Challenge.count} challenges"
puts "Created #{PathChallenge.count} Path challenges"
puts "Created #{UserPathway.count} User Pathways"
puts "Created #{UserChallenge.count} User challenges"

puts "-----------------"
puts "SEED FINISHED"

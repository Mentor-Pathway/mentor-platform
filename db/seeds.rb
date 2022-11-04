User.destroy_all
PathChallenge.destroy_all
Pathway.destroy_all
Challenge.destroy_all

puts "RUNNING SEED FILE"
puts "-----------------"

pathway = Pathway.create!(title: "Test 1", details: "This is a test pathway", difficulty: "beginner")
puts "One pathway created"

challenge = Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)
puts "one challage created"

PathChallenge.create!(challenge_id: challenge.id, pathway_id: pathway.id, order: 1)
puts "one path_challenge created"


puts "-----------------"
puts "SEED FINISHED"
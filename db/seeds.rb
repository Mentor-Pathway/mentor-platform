User.destroy_all
Challenge.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"
User.create!(first_name: "Ben", last_name: "Simpson", email: "ben@ben.com", password: "Testpassword1!", role: :mentor)
puts "One user created"

Pathway.create!(title: "Test 1", details: "This is a test pathway", difficulty: "Easy")
puts "One pathway created"

Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)
puts "one challage created"


puts "-----------------"
puts "SEED FINISHED"

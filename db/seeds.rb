# remember to puts what is being seeded. 
User.destroy_all
Challenge.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"
User.create!(first_name: "Ben", last_name: "Simpson", email: "ben@ben.com", password: "Testpassword1!", role: :mentor)
puts "One user created"

Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)
puts "one challage created"

# Add new seeds here

puts "-----------------"
puts "SEED FINISHED"

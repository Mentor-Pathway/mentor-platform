# remember to puts what is being seeded. 
User.destroy_all
Challenge.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"
puts "creating one user"
User.create!(first_name: "Ben", last_name: "Simpson", email: "ben@ben.com", password: "Testpassword1!", role: :mentor)
puts "One user created"

Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)
puts "one challage created"

# Add new seeds here

puts "-----------------"
puts "SEED FINISHED"








# User.create( email: "ben@ben.com", encrypted_password: "qqqqqq")

# Challenge.create( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)

# Challenge.create( completed: "28/10/2022", notes: "Just to advise you that this is a test run.", feedback: "You are doing really well, keep it up son", rating: 4, user_id: User.last.id)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)




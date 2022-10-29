User.create!( email: "ben@ben.com", password: "qqqqqq")

Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

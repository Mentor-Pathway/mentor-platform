Pathway.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
User.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"

@mentor = User.create!(
    first_name: "Mentor", last_name: "Test", email: "mentor@test.com", password: "Testpassword1!", role: "mentor")

@mentee = User.create!(
    first_name: "Mentee", last_name: "Test", email: "mentee@test.com", password: "Testpassword1!", role: "mentee")

level = ["beginner", "intermidiate", "professional", "expert" ]

mark = ["1", "2", "3", "4", "5" ]

def CreateChallenge(order)
    Challenge.create!(
        title: "Q #{order} Public Cloud and Private Cloud provider",
        details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
        Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        user_id: @mentor.id 
    )

    PathChallenge.create!(
        challenge_id: Challenge.last.id,
        pathway_id: Pathway.last.id, 
        order: order  
    )
end

5.times do |i| 
    level_choice = rand(0..3) 
    Pathway.create!(
    title: "Pathway, #{i}!",
    details: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. #{i}!",
    difficulty: level[level_choice] ,)

    20.times do |i| 
        CreateChallenge(i)
        
        20.times do |i|
            mark_choice = rand(0..4)
            UserChallenge.create!(
            notes: "All questions answered correctly and presented on time. #{i}!",
            feedback: "I am impressed with the answers, only issue is I would have preferred more detail. Either way great job. #{i}!",
            rating: mark[mark_choice] ,)
        end 
    end         
end

challenge = Challenge.create!( title: "Database number 1", details: "This is a question that needs answers regarding the database", user_id: User.last.id)
puts "one challage created"


puts "created #{User.count} users"
puts "created #{Pathway.count} pathways"
puts "Created #{Challenge.count} challenges"
puts "Created #{PathChallenge.count} Path challenges"
puts "created #{UserChallenge.count} User challenges"

puts "-----------------"
puts "SEED FINISHED"
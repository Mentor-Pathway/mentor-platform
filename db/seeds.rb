Pathway.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
User.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"

mentor = User.create!(
    first_name: "Mentor", last_name: "Test", email: "mentor@test.com", password: "Testpassword1!", role: "mentor")

mentee = User.create!(
    first_name: "Mentee", last_name: "Test", email: "mentee@test.com", password: "Testpassword1!", role: "mentee")    

path1 = Pathway.create!(
    title: "Cloud based questions",
    details: "These are introductry cloud based questions. If you have completed and understood the Cloud Practioner course you should find these questions relatively easy.",
    difficulty: "Low",
)

chall1 = Challenge.create!(
    title: "Q1. Public Cloud and Private Cloud provider",
    details: "In this excersice I need you to research and answer the following question. What is the difference between a Private cloud provider and a Public cloud provider? Please take your time and use the internet as a resource tool.",
    user_id: User.first.id
)

PathChallenge.create!(
    challenge_id: chall1.id,
    pathway_id: path1.id, 
    order: 1
)

chall2 = Challenge.create!(
    title: "Q2. Startups",
    details: "Please explain in detail what advantages does the cloud offer to startups? Please take your time and use the internet as a resource tool.",
    user_id: User.first.id 
)

PathChallenge.create!(
    challenge_id: chall1.id,
    pathway_id: path1.id, 
    order: 2
)

chall3 = Challenge.create!(
    title: "Q3. Saving cost",
    details: "For the last question, simply explain how does the scale of cloud computing help you to save costs?",
    user_id: User.first.id 
)

PathChallenge.create!(
    challenge_id: chall1.id,
    pathway_id: path1.id, 
    order: 3
)

chall4 = Challenge.create!(
    title: "Q4. Deployment models",
    details: "There are three cloud computing models. Can you please name the three different models?",
    user_id: User.first.id 
)

PathChallenge.create!(
    challenge_id: chall1.id,
    pathway_id: path1.id, 
    order: 4
)

UserChallenge.create!(
    notes: "All questions answered correctly and presented on time.",
    feedback: "I am impressed with the answers, only issue is I would have preferred more detail. Either way great job",
    rating: "4",
    user_id: User.first.id
)


puts "created #{User.count} users"
puts "created #{Pathway.count} pathways"
puts "Created #{Challenge.count} challenges"
puts "Created #{PathChallenge.count} Path Challenges"



puts "-----------------"
puts "SEED FINISHED"
Pathway.destroy_all
Challenge.destroy_all
UserChallenge.destroy_all
User.destroy_all
puts "RUNNING SEED FILE"
puts "-----------------"

User.create!(
    first_name: "Ben", last_name: "Simpson", email: "ben@ben.com", password: "Testpassword1!", role: "mentor")

Pathway.create!(
    title: "Cloud based questions",
    details: "These are introductry cloud based questions. If you have completed and understood the Cloud Practioner course you should find these questions relatively easy.",
    difficulty: "Low",
)

Challenge.create!(
    title: "Q1. Public Cloud and Private Cloud provider",
    details: "In this excersive I need you to research and answer the following question. What is the difference between a Private cloud provider and a Public cloud provider? Please take your time and use the internet as a resource tool.",
    user_id: User.last.id    
)

Challenge.create!(
    title: "Q2. Startups",
    details: "Please explain in detail what advantages does the cloud offer to startups? Please take your time and use the internet as a resource tool.",
    user_id: User.last.id
)

Challenge.create!(
    title: "Q3. Saving cost",
    details: "For the last question, simply explain how does the scale of cloud computing help you to save costs?",
    user_id: User.last.id
)

Challenge.create!(
    title: "Q4. Deployment models",
    details: "There are three cloud computing models. Can you please name the three different models?",
    user_id: User.last.id
)

UserChallenge.create!(
    notes: "I have answered all the questions to the best of my ability, whilst using the internet as resource.",
    feedback: "I am impressed with the answers, only issue is i would have preferred more detail. Either way great job",
    rating: "4",
    user_id: User.last.id
)


puts "created #{User.count} users"
puts "created #{Pathway.count} pathways"
puts "Created #{Challenge.count} challenges"



puts "-----------------"
puts "SEED FINISHED"
require "rails_helper"

RSpec.describe "Mentees", type: :system do
   
   before do
     driven_by (:rack_test)
     @mentee = create(:mentee)
     @pathway = create(:pathway)
     @profile = create(:profile)
   end

   it "valid with correct credentials" do
      visit new_user_session_path
      fill_in "user_email", with: @mentee.email
      fill_in "user_password", with: @mentee.password
      click_button "Log in"
      expect(page).to have_link "Log out"
   end
     
   it "Displaying pathways" do
      login_as(@mentee)
      visit pathways_path
      find("input[placeholder='Find a pathway']").set "value"
   end 

   it "Join a pathway" do
      login_as(@mentee)
      visit pathway_path(@pathway)
      expect(page).to have_content "Challenges"
      click_button "Pathway Signup"
      expect(page).to have_content "Congratulations, you have signed up to a Pathway!!!"
   end

   it "Pathway added to profile" do
      login_as(@mentee)
      UserPathway.create(user:@mentee,pathway:@pathway)
      visit profile_path(@profile)
      expect(page).to have_content(@pathway.title)
   end
     
end
require "rails_helper"

RSpec.describe "Mentees", type: :system do
   
   before do
     driven_by (:rack_test)
     @mentee = create(:mentee)
     @pathway = create(:pathway)
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
      expect(page).to have_content "Pathway One"
   end 

   it "Join a pathway" do
      login_as(@mentee)
      visit pathway_path(@pathway)
      expect(page).to have_content "Pathway One"
      click_button "Pathway Signup"
      expect(page).to have_content "Congratulations, you have signed up to a Pathway!!!"
   end

   it "Pathway added to profile" do
      login_as(@mentee)
      UserPathway.create(user:@mentee,pathway:@pathway)
      visit profile_path(@mentee)
      expect(page).to have_content "Pathway One"
   end
     

end
require "rails_helper"

RSpec.describe "Users", type: :system do
  context "sign in" do
    before do
      @user = create(:user)
      visit new_user_session_path
    end

    it "valid with correct credentials" do
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in"
      expect(page).to have_link "Log out"
    end
  end

  context "Sign up" do
    before do
      visit new_user_registration_path
    end

    it "valid with correct credentials" do
      fill_in "user_first_name", with: "test"
      fill_in "user_last_name", with: "user"
      fill_in "user_email", with: Faker::Internet.email
      fill_in "user_password", with: "Testpassword1!"
      fill_in "user_password_confirmation", with: "Testpassword1!"
      click_button "Sign up"
      expect(page).to have_link "Log out"
    end
  end

  
end

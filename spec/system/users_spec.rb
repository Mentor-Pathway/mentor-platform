require 'rails_helper'

RSpec.describe "Users", type: :system do

  context "sign in" do

    before do
      @user = create(:user)
      visit new_user_session_path
    end

    scenario "valid with correct credentials" do
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

    scenario "valid with correct credentials" do
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: @user.password
      click_button "Log in" 
      expect(page).to have_link "Log out"
    end
  end
end

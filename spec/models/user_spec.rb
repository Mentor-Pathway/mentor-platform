require 'rails_helper'

RSpec.describe User, type: :model do
  context "Create a user account:" do
    it "user must have first name, last name, role, email and password" do
      user = User.create!(first_name: "test", last_name: "user", role:"mentor", email: "test@test.com", password: "123456")
      expect(user).to eq(User.last) 
    end

    it "user must have first name nust not allow special characters" do
      user = User.create!(first_name: "test>", last_name: "user", role:"mentor", email: "test@test.com", password: "123456")
      expect(user).to !eq(User.last) 
    end
  end
end

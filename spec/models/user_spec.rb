require 'rails_helper'

RSpec.describe User, type: :model do
  context "Create a user account:" do
    it "user must have first name, last name, role, email and password" do
      user = User.create!(first_name: "test", last_name: "user", role: :mentor, email: "test@test.com", password: "Testpassword!1")
      expect(user).to eq(User.last) 
    end

    it "user must have first name must not allow special characters" do
      user = User.create!(first_name: "test><\?@*", last_name: "user", role: :mentor, email: "test1@test.com", password: "Testpassword!1")
      expect(user).not_to eq(User.last) 
    end

    it "user must have last name must not allow special characters" do
      user = User.create!(first_name: "test", last_name: "user><\?@*", role: :mentee, email: "test2@test.com", password: "Testpassword!1")
      expect(user).not_to eq(User.last) 
    end

    it "user role can eq `mentee` or `mentor`" do
      mentor = User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test3@test.com", password: "Testpassword!1")
      mentee = User.create!(first_name: "test", last_name: "user", role: :mentor, email: "test4@test.com", password: "Testpassword!1")
      expect{User.create!(first_name: "test", last_name: "user", role: "other", email: "test4@test.com", password: "Testpassword!1")}.to raise_error(ArgumentError, "'other' is not a valid role")
      expect(mentor.role).to eq("mentee")
      expect(mentee.role).to eq("mentor")
    end

    it "user has a valid email" do
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "tes", password: "123456")}.to raise_error(ActiveRecord::RecordInvalid)
      user = User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test5@test.com", password: "Testpassword!1")
      expect(user).to eq(User.last) 
    end

    it "user has a valid email" do
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "tes", password: "123456")}.to raise_error(ActiveRecord::RecordInvalid)
      user = User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test5@test.com", password: "Testpassword!1")
      expect(user).to eq(User.last) 
    end

    it "password must be valid - Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character" do
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test7@test.com", password: "123456")}.to raise_error(ActiveRecord::RecordInvalid)
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test7@test.com", password: "tyuiopdfdsah")}.to raise_error(ActiveRecord::RecordInvalid)
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test7@test.com", password: "!dfdsfdsfdfK")}.to raise_error(ActiveRecord::RecordInvalid)
      expect{User.create!(first_name: "test", last_name: "user", role: :mentee, email: "test6@test.com", password: "Testpassword!1")}.not_to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

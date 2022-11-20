require "rails_helper"

RSpec.describe User, type: :model do
  context "Create a user account:" do
    it "user must have first name, last name, role, email and password" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "user must have first name must not allow special characters" do
      user = build(:user, first_name: "test><\?@*")
      expect(user).not_to be_valid
    end

    it "user must have last name must not allow special characters" do
      user = build(:user, last_name: "user><\?@*")
      expect(user).not_to be_valid
    end

    it "user role can eq `mentee` or `mentor`" do
      mentor = build(:user, role: :mentor)
      mentee = build(:user, role: :mentor)

      expect(mentor).to be_valid
      expect(mentee).to be_valid

      expect { build(:user, role: "other") }.to raise_error(ArgumentError)
    end

    it "user has a valid email" do
      expect { create(:user, email: "test") }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "user has a unique email" do
      user1 = create(:user, email: "email1@example.com")
      expect { create(:user, email: "email1@example.com") }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "password must be valid - Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character" do
      password1 = build(:user, password: "123456")
      password2 = build(:user, password: "tyuiopdfdsah")
      password3 = build(:user, password: "!dfdsfdsfdfK")

      expect(password1).not_to be_valid
      expect(password2).not_to be_valid
      expect(password3).not_to be_valid
    end
    
    it 'user can be destroyed' do
      user = create((:user))
      expect { user.destroy }.to change { User.count }.by(-1)
    end
  end
end

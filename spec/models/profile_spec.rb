require "rails_helper"
require "open-uri"

RSpec.describe Profile, type: :model do
  describe "Associations" do

    it "must belong to a user" do
      profile = (build(:profile))
      expect(profile.user).to be_valid
    end
    
    it "has a profile picture" do
      profile = (build(:profile))
      file = URI.open("https://images.unsplash.com/photo-1613679074971-91fc27180061?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")
      profile.photo.attach(io: file, filename: "avatar.jpg")
      profile.save
      expect(profile.photo.attached?).to be_truthy
    end
  end

  describe "Validations" do
    it "Has a valid linkedin url" do
      expect { create(:profile, linkedin: 'Boris Johnson') }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Has a valid github url" do
      expect { create(:profile, github: 'torvalds') }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Bio has a minimum of 6 words" do
      expect { create(:profile, bio: 'Ever since I') }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "Job title contains no special characters" do
      expect { create(:profile, job: '&*^%$') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

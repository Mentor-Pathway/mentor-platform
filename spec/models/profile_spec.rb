require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "Associations" do
    it "A profile must belong to a user" do
      profile = (build(:profile))
      expect(profile.user).to be_valid
    end
    it "has a profile picture"
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

require "rails_helper"
require "open-uri"

RSpec.describe Profile, type: :model do
  describe "Associations" do
    it "must belong to a user" do
      expect { create(:profile, user: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User must exist")
    end

    it "can have a profile picture" do
      profile = create(:profile)
      file = URI.open("https://images.unsplash.com/photo-1613679074971-91fc27180061?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")
      profile.photo.attach(io: file, filename: "avatar.jpg")
      profile.save
      expect(profile.photo.attached?).to be_truthy
    end

    it 'can be associated to a tag' do
      profile = create(:profile)
      tag = create(:tag)
      create(:tagging, tag: tag, profile: profile)
      expect(profile.tags.last.name).to eq "JavaScript"
   end

    it "creating a user creates a profile" do
      user = create((:user))
      expect(user.profile).to be_an_instance_of Profile
    end

    it "destroying a user destroys its profile" do
      user = create((:user))
      expect { user.destroy }.to change { Profile.count }.by(-1)
    end
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    context "is valid" do
      it "without a job title" do
        profile = build(:profile, job: nil)
        expect(profile).to be_valid
      end

      it "without a linkedin" do
        profile = build(:profile, linkedin: nil)
        expect(profile).to be_valid
      end

      it "without a github" do
        profile = build(:profile, github: nil)
        expect(profile).to be_valid
      end

      it "without a bio" do
        profile = build(:profile, bio: nil)
        expect(profile).to be_valid
      end

      it 'cannot have the same tag twice' do
         profile = build(:profile)
         tag = build(:tag, name: 'Dev Ops')
         create(:tagging, tag: tag, profile: profile)
         expect{ create(:tagging, tag: tag, profile: profile) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Profile tag must be unique")
      end
    end

    context "if present" do
      it "linkedin url is a valid url" do
        expect { create(:profile, linkedin: "Boris Johnson") }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Linkedin is invalid")
      end

      it "github url is a valid url" do
        expect { create(:profile, github: "torvalds") }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Github is invalid")
      end

      it "bio is not too short" do
        expect { create(:profile, bio: "Ever since I") }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Bio is too short (minimum is 40 characters)")
      end

      it "bio is not too long " do
        expect { create(:profile, bio: ("a" * 2000).to_s) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Bio is too long (maximum is 1500 characters)")
      end

      it "Job title contains no special characters" do
        expect { create(:profile, job: "&*^%$") }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Job is invalid")
      end
    end
  end
end

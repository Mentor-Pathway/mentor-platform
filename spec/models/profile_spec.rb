require "rails_helper"

RSpec.describe Profile, type: :model do
  describe "Associations" do
    it "A profile must belong to a user" do
      profile = (build(:profile))
      expect(profile.user).to be_valid
    end
  end
  describe "Validations" do
    it "Has a valid linkedin url" do
      profile = (build(:profile))
      expect(profile.linkedin).to be_a_kind_of String 
    end
    it "Has a valid github url" do
      profile = (build(:profile))
      expect(profile.github).to be_a_kind_of String 
    end
  end

end

require "rails_helper"

RSpec.describe Challenge, type: :model do
  describe "associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:path_challenges) }
    it { should have_many(:pathways).through :path_challenges }
  end

  describe "create a challenge" do
    subject {
      described_class.new(
        user: create(:user),
        title: "Roman numeral to integer",
        description: "Convert Roman numerals to numbers and convert numbers to Roman numerals"
      )
    }
  end
end

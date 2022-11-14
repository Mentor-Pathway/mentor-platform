require "rails_helper"

RSpec.describe Challenge, type: :model do
  describe "associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:path_challenges) }
    it { should have_many(:pathways).through :path_challenges }
  end

  describe "create a challenge" do
    before :each do
      user = create(:user)
      subject { build(:described_class, user: user) }
    end
  end
end

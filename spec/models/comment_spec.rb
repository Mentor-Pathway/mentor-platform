require "rails_helper"
require "factory_bot_rails"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { is_expected.to validate_length_of(:message).is_at_most(1500) }
    it { is_expected.to validate_presence_of(:message) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user_challenge) }
    it { is_expected.to belong_to(:user) }
  end

  describe "comment validity" do
    it "is valid with valid attributes" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "is invalid without a message" do
      comment = build(:comment, message: nil)
      expect(comment).to be_invalid
    end
  end
end

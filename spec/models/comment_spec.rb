require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { is_expected.to validate_length_of(:message).is_at_most(1500) }
    it { is_expected.to validate_presence_of(:message) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user_challenge) }
    it { is_expected.to belong_to(:user) }
  end
end

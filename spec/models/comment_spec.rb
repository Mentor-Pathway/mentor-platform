require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "validations" do
    it { should validate_length_of(:message).is_at_most(1500) }
    it { should validate_presence_of(:message) }
  end

  describe "associations" do
    it { should belong_to(:user_challenge) }
    it { should belong_to(:user) }
  end
end

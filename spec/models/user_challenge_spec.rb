require "rails_helper"

RSpec.describe UserChallenge, type: :model do
    # Set up test data
  let(:user_challenge) { create(:user_challenge) }

  describe "validations" do
      it { should validate_length_of(:notes).is_at_most(1500) }
      it { should validate_numericality_of(:rating).is_less_than_or_equal_to(5).only_integer.is_greater_than_or_equal_to(1) }
      it { should allow_value(nil).for(:rating) }
   end

   describe "associations" do
      it { should have_many(:comments).dependent(:destroy) }
      it { should belong_to(:user_pathway) }
      it { should belong_to(:challenge) }
   end
end
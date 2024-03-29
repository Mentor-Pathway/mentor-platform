require "rails_helper"

RSpec.describe UserChallenge, type: :model do
  let(:user_challenge) { create(:user_challenge) }

  describe "validations" do
   #  it { is_expected.to validate_length_of(:notes).is_at_most(1500) }
    it { is_expected.to validate_numericality_of(:rating).is_less_than_or_equal_to(5).only_integer.is_greater_than_or_equal_to(1) }
    it { is_expected.to allow_value(nil).for(:rating) }
  end

  describe "associations" do
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to belong_to(:user_pathway) }
    it { is_expected.to belong_to(:challenge) }
  end
end

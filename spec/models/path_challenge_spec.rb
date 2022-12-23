require "rails_helper"

RSpec.describe PathChallenge, type: :model do
   describe "associations" do
      it { is_expected.to belong_to(:pathway) }
      it { is_expected.to belong_to(:challenge) }
   end
  
   describe "validations" do
      it { is_expected.to validate_numericality_of(:order).only_integer }
   end
end

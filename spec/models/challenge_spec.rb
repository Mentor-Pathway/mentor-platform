require 'rails_helper'

RSpec.describe Challenge, type: :model do
  context "create a challenge" do
   it "A challenge must have a title and details" do
    user = (create(:user))
    challenge = build(:challenge, user: user)
    expect(challenge).to be_valid
   end
  end
end

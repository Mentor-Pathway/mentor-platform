require "rails_helper"

RSpec.describe UserPathway, type: :model do
  describe 'Association' do
    it "must belong to a user" do
      expect { create(:user_pathway, user: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: User must exist")
    end
    it "must belong to a pathway" do
      expect { create(:user_pathway, pathway: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Pathway must exist")
    end
    it 'has user_challenges on creation' do
      pathway = (create(:pathway))
      challenge = (create(:challenge))
      path_challenge = (create(:path_challenge, pathway: pathway, challenge: challenge))
      user_pathway = (create(:user_pathway, pathway: pathway))
      expect(user_pathway.user_challenges).not_to be_empty
    end    
  end
end

require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { create(:note) }

  describe "Associations:" do
    it { is_expected.to belong_to(:user_challenge) }
  end

  describe "CRUD" do
    it "note must have user_challenge_id" do
      expect(note).to be_valid
    end

    it "note can be destroyed" do
      expect { note.destroy }.to change(described_class, :count).by(-1)
    end
  end
end

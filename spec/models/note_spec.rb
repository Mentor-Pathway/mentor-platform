require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) { create(:note) }

  describe "associations" do
    it { is_expected.to belong_to(:user_challenge) }
  end
end

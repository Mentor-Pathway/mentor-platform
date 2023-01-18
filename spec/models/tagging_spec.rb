require 'rails_helper'

RSpec.describe Tagging, type: :model do
   describe 'validations' do
      it 'is valid' do
         tagging = build(:tagging)
         expect(tagging).to be_an_instance_of Tagging
      end
      
      it "must belong to a tag" do
         expect { create(:tagging, tag: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Tag must exist")
      end
   end
    describe "associations" do
      it 'can be associated to a challenge' do
        challenge = create(:challenge)
        tagging = create(:tagging, challenge: challenge)
        expect(tagging).to be_an_instance_of Tagging
      end
      it 'can be associated to a pathway' do
         pathway = create(:pathway)
         tagging = create(:tagging, pathway: pathway)
         expect(tagging).to be_an_instance_of Tagging
       end      
    end
end

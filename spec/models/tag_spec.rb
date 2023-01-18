require 'rails_helper'

RSpec.describe Tag, type: :model do
   describe 'Validations' do
      it 'is valid' do
         tag = build(:tag)
         expect(tag).to be_an_instance_of Tag
      end
      
      it 'has a name as a string' do
         tag = create(:tag, name: 'Python')
         expect(tag.name).to be_a_kind_of String
      end

      it 'has a unique name' do
         create(:tag, name: 'Ruby')
         duplicate_tag = build(:tag, name: 'Ruby')
         expect {duplicate_tag.save!}.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name has already been taken")
      end
   end

  describe "Associations" do
   it 'can be associated to a pathway' do
      tag = create(:tag)
      pathway = create(:pathway)
      create(:tagging, tag: tag, pathway: pathway)
      expect(tag.pathways.last).to be_a_kind_of Pathway
   end

   it 'can be associated to a challenge' do
      tag = create(:tag)
      challenge = create(:challenge)
      create(:tagging, tag: tag, challenge: challenge)
      expect(tag.challenges.last).to be_a_kind_of Challenge
   end

   it 'can be associated to a profile' do
      tag = create(:tag)
      profile = create(:profile)
      create(:tagging, tag: tag, profile: profile)
      expect(tag.profiles.last).to be_a_kind_of Profile
   end
  end
end

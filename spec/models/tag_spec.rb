require 'rails_helper'

RSpec.describe Tag, type: :model do
  it 'is valid' do
   tag = build(:tag)
   expect(tag).to be_an_instance_of Tag
  end

  it 'has a name as a string' do
   tag = create(:tag, name: 'Python')
   expect(tag.name).to be_a_kind_of String
  end

  describe "Associations" do
   it 'can be associated to a pathway' do
      tag = create(:tag)
      pathway = create(:pathway)
      create(:tagging, tag: tag, pathway: pathway)
      expect(tag.pathways.last.name).to be_a_kind_of Pathway
   end
  end
end

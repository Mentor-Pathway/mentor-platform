require 'rails_helper'

RSpec.describe Tagging, type: :model do
   it 'is valid' do
      tagging = build(:tagging)
      expect(tagging).to be_an_instance_of Tagging
     end
   
     it "must belong to a tag" do
      expect { create(:tagging, tag: nil) }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Tag must exist")
    end
end

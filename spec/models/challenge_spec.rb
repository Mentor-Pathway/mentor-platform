require "rails_helper"

RSpec.describe Challenge, type: :model do
  describe "associations" do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:path_challenges) }
    it { should have_many(:pathways).through :path_challenges }
  end

  describe "create a challenge" do
    subject {
      described_class.new(
        user: create(:user),
        title: "Roman numeral to integer",
        details: "Convert Roman numerals to numbers and convert numbers to Roman numerals"
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "details validation" do
      context "no details" do
        it "is not valid without a details" do
          subject.details = nil
          expect(subject).to_not be_valid
        end
      end

      context "details are too short" do
        it "is not valid with too short details" do
          subject.details = "abc"
          expect(subject).to_not be_valid
        end
      end

      context "details too long" do
        it "is not valid with too long details" do
          subject.details = ("a" * 1501).to_s
          expect(subject).to_not be_valid
        end
      end
    end

    describe "title validation" do
      context "no title" do
        it "is not valid without a title" do
          subject.title = nil
          expect(subject).to_not be_valid
        end
      end

      context "title too short" do
        it "is not valid with too short a title" do
          subject.title = "abc"
          expect(subject).to_not be_valid
        end
      end

      context "title too long" do
        it "is not valid with too long a title" do
          subject.title = ("a" * 51).to_s
          expect(subject).to_not be_valid
        end
      end

      context "invalid chars" do
        it "is not valid with invalid characters" do
          subject.title = "!!**?!#@"
          expect(subject).to_not be_valid
        end
      end
    end
  end
end

# https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
# http://matchers.shoulda.io/docs/v4.0.1/Shoulda/Matchers/ActiveRecord.html

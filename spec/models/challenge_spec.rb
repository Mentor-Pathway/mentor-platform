require "rails_helper"
require "open-uri"

RSpec.describe Challenge, type: :model do
  describe "validations" do
    it { should validate_presence_of(:user) }
  end

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

    it "can have an attached photo" do
      file = URI.open("https://source.unsplash.com/random")
      subject.photo.attach(io: file, filename: "random.jpg")
      subject.save
      expect(subject.photo.attached?).to be_truthy
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    describe "details validation" do
      context "no details" do
        it "is not valid without details" do
          subject.details = nil
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Details can't be blank, Details is too short (minimum is 50 characters)")
        end
      end

      context "details are too short" do
        it "is not valid with too short details" do
          subject.details = "abc"
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Details is too short (minimum is 50 characters)")
        end
      end

      context "details too long" do
        it "is not valid with too long details" do
          subject.details = ("a" * 1501).to_s
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Details is too long (maximum is 1500 characters)")
        end
      end
    end

    describe "title validation" do
      context "no title" do
        it "is not valid without a title" do
          subject.title = nil
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank, Title is invalid, Title is too short (minimum is 8 characters)")
        end
      end

      context "title too short" do
        it "is not valid with too short a title" do
          subject.title = "abc"
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title is too short (minimum is 8 characters)")
        end
      end

      context "title too long" do
        it "is not valid with too long a title" do
          subject.title = ("a" * 51).to_s
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title is too long (maximum is 50 characters)")
        end
      end

      context "invalid chars" do
        it "is not valid with invalid characters" do
          subject.title = "!*?!#@^(){}"
          expect { subject.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Title is invalid")
        end
      end
    end
  end
end

# https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec
# http://matchers.shoulda.io/docs/v4.0.1/Shoulda/Matchers/ActiveRecord.html
# https://www.rubypigeon.com/posts/rspec-expectations-cheat-sheet/
# https://relishapp.com/rspec/rspec-expectations/v/2-8/docs/built-in-matchers/raise-error-matcher#expect-specific-error
# https://ruby-doc.org/stdlib-2.6.3/libdoc/open-uri/rdoc/OpenURI.html
# https://guides.rubyonrails.org/v7.0.0/active_storage_overview.html

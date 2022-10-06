class AddCompletedNotesFeedbackRatingToUserChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :challenges, :completed, :datetime
    add_column :challenges, :notes, :text
    add_column :challenges, :feedback, :text
    add_column :challenges, :rating, :interger
  end
end

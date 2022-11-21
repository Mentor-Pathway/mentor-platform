class RemoveNotesFromUserChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_challenges, :notes, :text
  end
end

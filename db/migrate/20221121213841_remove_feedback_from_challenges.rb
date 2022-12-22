class RemoveFeedbackFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :feedback, :text
  end
end

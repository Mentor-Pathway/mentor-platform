class RemoveFeedbackFromUserChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_challenges, :feedback, :text
  end
end

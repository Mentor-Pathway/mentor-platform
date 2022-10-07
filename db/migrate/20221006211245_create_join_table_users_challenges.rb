class CreateJoinTableUsersChallenges < ActiveRecord::Migration[7.0]
  def change
    create_join_table :users, :challenges do |t|
      t.index [:user_id, :challenge_id]
      t.index [:challenge_id, :user_id]
      t.date :completed
      t.text :user_notes
      t.text :res_feedback
      t.integer :rating

      t.timestamps
    end
  end
end

class RemoveUserFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_reference :challenges, :user, null: false, foreign_key: true
  end
end

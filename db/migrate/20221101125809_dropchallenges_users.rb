class DropchallengesUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :challenges_users
  end
end

class AddCreatorToChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :challenges, :user, null: false, foreign_key: true
  end
end

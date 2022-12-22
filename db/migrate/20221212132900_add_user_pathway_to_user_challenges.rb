class AddUserPathwayToUserChallenges < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_challenges, :user_pathway, null: false, foreign_key: true
  end
end

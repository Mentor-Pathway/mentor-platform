class CreateUserChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :user_challenges do |t|
      t.references :challenge, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

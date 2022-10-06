class CreatePathChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :path_challenges do |t|
      t.references :challenge
      t.references :pathway
      t.integer :order
      t.timestamps
    end
  end
end

class CreateChallenges < ActiveRecord::Migration[7.0]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :details
      t.references :user, foriegn_key: true

      t.timestamps
    end
  end
end

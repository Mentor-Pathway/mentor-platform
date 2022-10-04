class CreatePathways < ActiveRecord::Migration[7.0]
  def change
    create_table :pathways do |t|
      t.string :title
      t.text :details
      t.string :difficulty

      t.timestamps
    end
  end
end

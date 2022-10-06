class CreateUserPathways < ActiveRecord::Migration[7.0]
  def change
    create_table :user_pathways do |t|
      t.references :pathway
      t.references :user
      t.datetime :completed
      t.timestamps
    end
  end
end

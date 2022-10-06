class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :job
      t.timestamps
    end
  end
end

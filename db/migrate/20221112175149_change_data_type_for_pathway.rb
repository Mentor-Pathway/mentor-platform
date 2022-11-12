class ChangeDataTypeForPathway < ActiveRecord::Migration[7.0]
  def change
    remove_column :pathways, :difficulty
    add_column :pathways, :difficulty, :integer
  end
end

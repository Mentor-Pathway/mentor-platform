class DropGoals < ActiveRecord::Migration[7.0]
  def change
    drop_table :goals
  end
end

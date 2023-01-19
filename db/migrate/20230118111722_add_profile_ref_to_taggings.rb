class AddProfileRefToTaggings < ActiveRecord::Migration[7.0]
  def change
    add_reference :taggings, :profile, null: true, foreign_key: true
  end
end

class AddChallengeRefToTaggings < ActiveRecord::Migration[7.0]
  def change
    add_reference :taggings, :challenge, null: true, foreign_key: true
  end
end

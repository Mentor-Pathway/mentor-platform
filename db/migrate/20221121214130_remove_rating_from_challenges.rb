class RemoveRatingFromChallenges < ActiveRecord::Migration[7.0]
  def change
    remove_column :challenges, :rating, :integer
  end
end

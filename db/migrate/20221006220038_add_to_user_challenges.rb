class AddToUserChallenges < ActiveRecord::Migration[7.0]
  def change
    add_column :user_challenges, :completed, :datetime
    add_column :user_challenges, :notes, :text
    add_column :user_challenges, :feedback, :text
    add_column :user_challenges, :rating, :integer
  end
end

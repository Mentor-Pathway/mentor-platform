class AddApproveToUserPathway < ActiveRecord::Migration[7.0]
  def change
    add_column :user_pathways, :approved, :boolean, default: false
  end
end

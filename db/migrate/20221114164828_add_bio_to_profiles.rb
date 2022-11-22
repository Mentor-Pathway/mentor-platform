class AddBioToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :bio, :text
  end
end

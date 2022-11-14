class AddLinkedinToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :linkedin, :string
  end
end

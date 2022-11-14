class AddGithubToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :github, :string
  end
end

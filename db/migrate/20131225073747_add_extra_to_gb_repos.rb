class AddExtraToGbRepos < ActiveRecord::Migration
  def change
    add_column :gb_repos, :extra, :text
  end
end

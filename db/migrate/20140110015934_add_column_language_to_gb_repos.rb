class AddColumnLanguageToGbRepos < ActiveRecord::Migration
  def change
    add_column :gb_repos, :language, :string
    add_index :gb_repos, :language
  end
end

class CreateTableGbReposGbUsers < ActiveRecord::Migration
  def up
    create_table :gb_repos_gb_users do |t|
      t.integer :gb_repo_id,:null=>false
      t.integer :gb_user_id,:null=>false
    end
  end

  def down
  end
end

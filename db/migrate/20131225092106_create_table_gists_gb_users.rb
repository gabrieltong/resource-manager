class CreateTableGistsGbUsers < ActiveRecord::Migration
  def up
    create_table :gb_users_gists do |t|
      t.integer :gb_user_id,:null=>false
      t.integer :gist_id,:null=>false
    end
  end

  def down
  end
end

class CreateTableGbUsersUsers < ActiveRecord::Migration
  def up
    create_table :gb_users_users do |t|
      t.integer :gb_user_id,:null=>false
      t.integer :user_id,:null=>false
    end
  end

  def down
  end
end

class AddGbUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gb_username, :string
  end
end

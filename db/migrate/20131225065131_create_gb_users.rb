class CreateGbUsers < ActiveRecord::Migration
  def change
    create_table :gb_users do |t|
      t.string :username

      t.timestamps
    end
  end
end

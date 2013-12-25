class CreateGbRepos < ActiveRecord::Migration
  def change
    create_table :gb_repos do |t|
      t.string :address

      t.timestamps
    end
  end
end

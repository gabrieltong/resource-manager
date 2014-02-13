class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :stage
      t.string :address
      t.text :extra

      t.timestamps
    end
  end
end

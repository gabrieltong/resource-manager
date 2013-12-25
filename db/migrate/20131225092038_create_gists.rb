class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :address
      t.text :extra

      t.timestamps
    end
  end
end

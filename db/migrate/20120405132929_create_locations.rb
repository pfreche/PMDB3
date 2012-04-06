class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :uri
      t.string :description
      t.integer :usagetype

      t.timestamps
    end
  end
end

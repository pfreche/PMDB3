class CreateMediaObjects < ActiveRecord::Migration
  def change
    create_table :media_objects do |t|
      t.string :name
      t.datetime :modified
      t.date :mod_date
      t.integer :folder_id
      t.string :type

      t.timestamps
    end
  end
end

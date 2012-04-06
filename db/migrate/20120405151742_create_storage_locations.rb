class CreateStorageLocations < ActiveRecord::Migration
  def change
    create_table :storage_locations do |t|
      t.integer :storage_id
      t.integer :filePath_id
      t.integer :webPath_id
      t.integer :tnFilePath_id
      t.integer :tnWebPath_id
      t.boolean :inUse

      t.timestamps
    end
  end
end

class CreateAttrisMediaObjects < ActiveRecord::Migration
  def change
    create_table :attris_media_objects do |t|
      t.integer :media_object_id
      t.integer :attri_id
    end
  end
end

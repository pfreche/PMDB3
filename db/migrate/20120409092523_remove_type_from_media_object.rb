class RemoveTypeFromMediaObject < ActiveRecord::Migration
  def up
    remove_column :media_objects, :type
  end

  def down
    add_column :media_objects, :type, :string
  end
end

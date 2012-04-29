class AddTypToMediaObject < ActiveRecord::Migration
  def change
    add_column :media_objects, :typ_id, :integer
  end
end

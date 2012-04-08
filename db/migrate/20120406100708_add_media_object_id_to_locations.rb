class AddMediaObjectIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :mediaObject_id, :integer
  end
end

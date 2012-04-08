class AddMediaObjectIdToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :mediaObject_id, :integer
  end
end

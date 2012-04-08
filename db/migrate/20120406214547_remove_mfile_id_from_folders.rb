class RemoveMfileIdFromFolders < ActiveRecord::Migration
  def up
    remove_column :folders, :mfile_id
  end

  def down
    add_column :folders, :mfile_id, :integer
  end
end

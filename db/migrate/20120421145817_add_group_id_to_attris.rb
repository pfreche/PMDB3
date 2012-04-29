class AddGroupIdToAttris < ActiveRecord::Migration
  def change
    add_column :attris, :group_id, :integer
  end
end

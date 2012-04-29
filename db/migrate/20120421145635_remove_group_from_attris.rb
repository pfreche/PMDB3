class RemoveGroupFromAttris < ActiveRecord::Migration
  def up
    remove_column :attris, :group
  end

  def down
    add_column :attris, :group, :string
  end
end

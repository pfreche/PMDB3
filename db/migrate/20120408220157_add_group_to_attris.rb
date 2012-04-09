class AddGroupToAttris < ActiveRecord::Migration
  def change
    add_column :attris, :group, :string
  end
end

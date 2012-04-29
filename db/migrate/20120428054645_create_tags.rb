class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.text :description
      t.integer :mediaObject_id

      t.timestamps
    end
  end
end

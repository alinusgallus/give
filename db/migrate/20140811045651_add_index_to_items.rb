class AddIndexToItems < ActiveRecord::Migration
  def change
    add_column :items, :category, :string
    add_index :items, :category
  end
end

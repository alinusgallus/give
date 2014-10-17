class AddItemIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :items_id, :integer
  end
end

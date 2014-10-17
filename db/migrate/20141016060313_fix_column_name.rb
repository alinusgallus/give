class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :messages, :items_id, :item_id
  end
end

class ChnageDataTypeForCatergory < ActiveRecord::Migration
  def change
  	change_column :items, :category,  :integer
  end
end

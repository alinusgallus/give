class ChangeKeysFormatinMessageTable < ActiveRecord::Migration

  def up
    change_column :messages, :sender, :integer
    change_column :messages, :recipient, :integer
  end

  def down
    change_column :messages, :sender, :string
    change_column :messages, :recipient, :string
  end

end

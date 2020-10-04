class PutDefaultValueToUPermissionLevel < ActiveRecord::Migration[6.0]
  def change
    remove_column :us, :permission_level, :integer
    add_column :us, :permission_level, :integer, default: 01
  end
end

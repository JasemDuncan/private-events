class ChangePersmisionlevelStringToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :us, :permission_level
    add_column :us, :permission_level, :integer
  end
end

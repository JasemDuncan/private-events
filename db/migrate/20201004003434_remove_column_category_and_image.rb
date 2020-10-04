class RemoveColumnCategoryAndImage < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :category
    remove_column :events, :image
  end
end

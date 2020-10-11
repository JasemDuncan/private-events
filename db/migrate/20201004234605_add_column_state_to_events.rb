class AddColumnStateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :state, :string, default: "in_draft"
  end
end

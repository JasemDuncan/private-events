class AddCoverToEvents < ActiveRecord::Migration[6.0]
  def change
    add_attachment :events, :cover
  end
end

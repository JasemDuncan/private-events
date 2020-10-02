class CreateUsevents < ActiveRecord::Migration[6.0]
  def change
    create_table :usevents do |t|
      t.belongs_to :u, null: false, foreign_key: true
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end

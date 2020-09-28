class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :name
      t.text :organizer
      t.text :description
      t.text :type
      t.text :category
      t.text :tags
      t.date :datestart
      t.date :dateend
      t.time :timestart
      t.time :timeend
      t.integer :attendees
      t.string :location
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end

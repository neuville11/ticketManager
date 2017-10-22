class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :place
      t.datetime :event_datetime
      t.integer :capacity
      t.boolean :available, default: true
      t.integer :seats_taken, default: 0
      t.timestamps
    end
  end
end

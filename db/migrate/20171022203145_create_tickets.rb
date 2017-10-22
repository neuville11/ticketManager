class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.string :code
      t.string :ticket_url
      t.string :seat_number
      t.timestamps
    end
  end
end

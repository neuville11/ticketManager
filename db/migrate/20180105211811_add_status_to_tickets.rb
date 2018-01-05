class AddStatusToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :status, :string, default: 'pending'
  end
end

class AddQrCodeToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :qr_code, :string
  end
end

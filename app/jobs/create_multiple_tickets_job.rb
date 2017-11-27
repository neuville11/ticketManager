class CreateMultipleTicketsJob < ApplicationJob
  require 'securerandom'
  require 'rqrcode'
  queue_as :default

  def perform(event)
    times_to_be_performed = event.capacity
    for index in 1..times_to_be_performed
      code = event.id.to_s + "-" + SecureRandom.hex(3) + "-" + index.to_s
      generate_qr_code(code)
      ticket = Ticket.new ( event_id: event.id,
                            code: code,
                            ticket_url: ticket_url
                          )
      ticket.save
    end
  end

  def generate_qr_code (code)
    qrcode = RQRCode::QRCode.new(ticket_url)
    image = qrcode.as_png
  end
end

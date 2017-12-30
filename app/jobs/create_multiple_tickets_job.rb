class CreateMultipleTicketsJob < ApplicationJob
  require 'securerandom'
  require 'rqrcode'
  queue_as :default

  def perform(event)
    times_to_be_performed = event.capacity
    for index in 1..times_to_be_performed
      code = event.id.to_s + "-" + SecureRandom.hex(3) + "-" + index.to_s
      url = 'https://tickt-manager.herokuapp.com/tickets/' + code
      ticket = Ticket.create(event_id: event.id, code: code, ticket_url: url )
      ticket.qr_code = generate_qr_code(url)
      ticket.save
    end
  end

  def generate_qr_code (url)
    qrcode = RQRCode::QRCode.new(url, size: 8, level: :h)
    qrcode.as_html
  end
end

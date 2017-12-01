class CreateMultipleTicketsJob < ApplicationJob
  require 'securerandom'
  require 'rqrcode'
  queue_as :default

  def perform(event)
    times_to_be_performed = event.capacity
    for index in 1..times_to_be_performed
      code = event.id.to_s + "-" + SecureRandom.hex(3) + "-" + index.to_s
      url = 'http://localhost:3000/tickets/' + code
      ticket = Ticket.create(event_id: event.id, code: code, ticket_url: url )
      ticket.save
      generate_qr_code(url)
    end
  end

  def generate_qr_code (url)
    qrcode = RQRCode::QRCode.new(url)
    image = qrcode.as_png(
                            resize_gte_to: false,
                            resize_exactly_to: false,
                            fill: 'white',
                            color: 'black',
                            size: 120,
                            border_modules: 4,
                            module_px_size: 6,
                            file: nil # path to write
                          )
  end
end

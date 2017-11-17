class CreateMultipleTicketsJob < ApplicationJob
  require 'securerandom'
  queue_as :default

  def perform(event)
    times_to_be_performed = event.capacity
    for index in 1..times_to_be_performed
      code = event.id.to_s + "-" + SecureRandom.hex(3) + "-" + index.to_s
      ticket = Ticket.new(event_id: event.id, code: code )
      ticket.save
    end
  end
end

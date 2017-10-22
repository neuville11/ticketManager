json.extract! ticket, :id, :event_id, :code, :ticket_url, :seat_number, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)

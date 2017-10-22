json.extract! event, :id, :name, :description, :place, :event_datetime, :capacity, :seats_taken, :created_at, :updated_at
json.url event_url(event, format: :json)

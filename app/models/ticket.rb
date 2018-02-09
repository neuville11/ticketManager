class Ticket < ApplicationRecord
  has_one :event
  paginates_per 25

  STATUS = [
    'Pending',
    'Checked'
  ]
end

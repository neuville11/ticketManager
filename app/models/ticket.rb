class Ticket < ApplicationRecord
  has_one :event
  belongs_to :event
  paginates_per 25
end

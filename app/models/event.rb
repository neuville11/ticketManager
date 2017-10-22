class Event < ApplicationRecord
  has_many :tickets
  paginates_per 10
end

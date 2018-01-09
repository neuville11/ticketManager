class Administrative < ApplicationRecord
  has_one :user, as: :rolable, dependent: :destroy, required: true
  paginates_per 10
end

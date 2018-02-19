class TicketPolicy < ApplicationPolicy
  def update?
    user.admin? or not record.published?
  end

  def can_see?
    user.admin?
  end
end
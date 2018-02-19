class TicketPolicy < ApplicationPolicy
  def update?
    user.admin? or not ticket.published?
  end

  def can_see?
    user.admin?
  end

  private

  def admin?
    user.rolable_type == 'Administrative'
  end

  def ticket
    record
  end
end
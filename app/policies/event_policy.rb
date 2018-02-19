class EventPolicy < ApplicationPolicy
  def update?
    user.admin? or not event.published?
  end

  def can_see?
    admin?
  end

  private

  def admin?
    user&.rolable_type == 'Administrative'
  end

  def event
    record
  end
end
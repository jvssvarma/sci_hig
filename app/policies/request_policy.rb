class RequestPolicy < ApplicationPolicy
  def update?
    return true if record_approved? && admin?
    return true if user_or_admin && !record_approved?
  end

  private

  def user_or_admin
    record.user_id == user.id || admin?
  end

  def admin?
    user_types.include?(user.type)
  end

  def record_approved?
    record.approved?
  end
end

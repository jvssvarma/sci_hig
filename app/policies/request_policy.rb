class RequestPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || user_types.include?(user.type)
  end
end

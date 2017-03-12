class AuditLog < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, confirmed: 1 }
  validates_presence_of :user_id, :status, :start_date
  after_initialize :set_defaults

  private

  def set_defaults
    self.start_date ||= Date.today.beginning_of_week
  end
end

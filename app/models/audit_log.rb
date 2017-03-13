class AuditLog < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, confirmed: 1 }
  validates_presence_of :user_id, :status, :start_date
  after_initialize :set_defaults
  before_update :set_end_date, if: :confirmed?

  private

  def set_defaults
    self.start_date ||= 1.week.ago.beginning_of_week
  end

  def set_end_date
    self.end_date = Date.today
  end
end

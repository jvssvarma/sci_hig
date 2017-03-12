class Request < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :reason, :request_hours
  validates :request_hours, numericality: { greater_than: 0.0 }
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  scope :requests_added_by, -> (user) { where(user_id: user.id) }
  after_save :update_audit_log

  private

  def update_audit_log
    audit_log = AuditLog.where(user_id: self.user.id, start_date: (1.week.ago.beginning_of_week)).last
    audit_log.confirmed!
  end
end

class Request < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :work_summary, :in_time, :out_time
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  scope :requests_added_by, -> (user) { where(user_id: user.id) }
  before_save :set_day_hours
  after_save :confirm_audit_log, if: :submitted?
  after_save :unconfirm_audit_log, if: :rejected?

  private

  def set_day_hours
    self.day_hours = ((self.out_time - self.in_time)/3600).round(2)
  end

  def confirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (1.week.ago.beginning_of_week..1.week.ago.end_of_week)).last
    audit_log.confirmed! if audit_log
  end

  def unconfirm_audit_log
    audit_log = AuditLog.where(user_id: self.user_id, start_date: (1.week.ago.beginning_of_week..1.week.ago.end_of_week)).last
    audit_log.pending! if audit_log
  end
end

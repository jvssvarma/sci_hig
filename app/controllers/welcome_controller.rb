class WelcomeController < ApplicationController
  def index
    if admintypes.include?(current_user.type)
      @pending_requests = Request.submitted
      @recent_audits = AuditLog.last(10)
    else
      @pending_audit_confirmations = current_user.audit_logs.pending
    end
  end
end

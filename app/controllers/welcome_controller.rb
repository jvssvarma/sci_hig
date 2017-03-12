class WelcomeController < ApplicationController
  def index
    @pending_requests = Request.where(status: 'submitted')
    @recent_audits = AuditLog.last(10)
  end
end

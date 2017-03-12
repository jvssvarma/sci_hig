class WelcomeController < ApplicationController
  def index
    if admintypes.include?(current_user.type)
      @pending_requests = Request.submitted
      @recent_audits = AuditLog.last(10)
    else
    end
  end
end

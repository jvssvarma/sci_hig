class ManagerMailer < ApplicationMailer
  def email manager
    @manager = manager
    mail(to: @manager.email, subject: "Daily Mail - Pending Overtime Requests")
  end
end

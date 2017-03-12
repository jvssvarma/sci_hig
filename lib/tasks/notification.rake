namespace :notification do
  desc "Sends SMS notifications to Employees to confirm overtime"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please log into the EOM dashboard to request or confirm hours for last week: http://immense-taiga-45522.herokuapp.com/"

      employees.each do |employee|
        SmsMessage.send_sms(number: employee.phone, message: notification_message)
      end
    end
  end

  desc "Sends mail notifications to managers everyday to approve pending requests"
  task manager_email: :environment do
    # iterate over pending requests and email the manager/admin by iterating over them
    submitted_requests = Request.submitted
    admin_users = AdminUser.all

    if submitted_requests.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end

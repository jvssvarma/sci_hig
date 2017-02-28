namespace :notification do
  desc "Sends SMS notifications to Employees to confirm overtime"
  task sms: :environment do

    # User.all.each do |user|
    #   SmsMessage.send_sms()
    # end
  end
end

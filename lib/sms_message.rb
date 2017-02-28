module SmsMessage
  def self.send_sms(number:, message:)
    puts "'#{message}' sent to #{number}"
  end
end

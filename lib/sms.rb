module Sms
  def self.send(number:, message:)
    puts "'#{message}' sent to #{number}"
  end
end

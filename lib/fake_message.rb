module FakeMessage
  Messages = Struct.new(:number, :message)
  @messages = []

  def self.send_sms(number:, message:)
    @messages << Messages.new(number, message)
  end

  def self.all_messages
    @messages
  end
end

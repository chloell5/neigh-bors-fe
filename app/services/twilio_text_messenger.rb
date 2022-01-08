class TwilioTextMessenger
  attr_reader :message

  def initialize(message, recipient_number)
    @message = message
    @recipient_number = recipient_number
  end

  def call
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['auth_token']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    client.messages.create({
      from: ENV['twilio_phone_number'],
      to: @recipient_number,
      body: @message
    })
  end
end

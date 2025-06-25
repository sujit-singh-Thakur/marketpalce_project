class SmsSender
  def self.send_sms(to:, body:)
    client = Twilio::REST::Client.new(
      ENV['TWILIO_ACCOUNT_SID'],
      ENV['TWILIO_AUTH_TOKEN']
    )

    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to,
      body: body
    )
  rescue => e
    Rails.logger.error "SMS sending failed: #{e.message}"
  end
end

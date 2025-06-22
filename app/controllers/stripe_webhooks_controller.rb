class StripeWebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
    event = nil

    begin
      event = Stripe::Event.construct_from(JSON.parse(payload, symbolize_names: true))
    rescue JSON::ParserError => e
      status 400
      return
    end

    case event.type
    when 'checkout.session.completed'
      session = event.data.object
      application_id = session.metadata.application_id
      Payment.create!(
        amount: session.amount_total,
        status: session.payment_status,
        application_id: application_id
      )
    end

    render json: { message: 'success' }
  end
end

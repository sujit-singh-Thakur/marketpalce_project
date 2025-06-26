class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
     @payments = Payment.includes(:application).where(applications: { task: { contractor_id: current_user.id } })
  end
 
  def new
     @application = Application.find(params[:application_id])
     @payment = Payment.new
  end

  def create
      @application = Application.find(params[:application_id])
      @amount = 100000

      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
        price_data: {
            currency: 'inr',
            unit_amount: @amount,
            product_data: {
            name: "Payment for Task ##{@application.task.id}"
            }
        },
        quantity: 1
        }],
        mode: 'payment',
        success_url: payments_success_url + "?session_id={CHECKOUT_SESSION_ID}",
        cancel_url: applications_contractors_url,
        metadata: {
        application_id: @application.id
        }
      )
      redirect_to session.url, allow_other_host: true
  end

  def success
        session = Stripe::Checkout::Session.retrieve(params[:session_id])
        application_id = session.metadata.application_id
        payment_intent = Stripe::PaymentIntent.retrieve(session.payment_intent)

      Payment.create!(
        amount: payment_intent.amount,
        status: payment_intent.status,
        application_id: application_id
      )
     redirect_to applications_contractors_path, notice: "Payment successful!"
  end
end


class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def payment_success_callback
    Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:STRIPE_SK].to_s

    endpoint_secret = Rails.application.credentials[Rails.env.to_sym][:ENDPOINT_SECRET].to_s

    event = nil

    # Verify webhook signature and extract the event
    # See https://stripe.com/docs/webhooks/signatures for more information.
    begin
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      payload = request.body.read
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      # Invalid payload
      return status 400
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      return status 400
    end

    case event['type']
    when 'checkout.session.completed'
      checkout_session = event['data']['object']
      ref_no = checkout_session['metadata']['ref_no']

      order = Order.find_by_ref_no(ref_no)
      order.update(status: 'paid', charge_id: checkout_session['payment_intent'])
    end
  end
end

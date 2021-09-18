class StripesController < UsersController
  def create
    @order = Order.find(params[:order_id])

    domain = 'http://localhost:3000'

    Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:STRIPE_SK].to_s

    session = Stripe::Checkout::Session.create({
                payment_method_types: ['card',
                ],
                line_items: [{
                  # TODO: replace this with the `price` of the product you want to sell
                  price_data: {
                    unit_amount: (@order.total.to_f * 100).to_i,
                    currency: 'myr',
                    product_data: {
                      name: @order.product.name
                    },
                  },
                  quantity: 1,
                }],
                mode: 'payment',
                metadata: {
                  ref_no: @order.ref_no
                },
                success_url: domain + product_order_success_path(@order.product, @order),
                cancel_url: domain + product_order_cancel_path(@order.product, @order),
              })

    redirect_to session.url
  end
end

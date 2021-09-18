class OrdersController < UsersController

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.create(order_params.merge(user_id: current_user.id))

    if @order.save
      redirect_to user_path(current_user), notice: 'Order was successfully created.'
    else
      redirect_to product_path(@product), alert: 'There was an error. Please try again.'
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def payment_details
    @order = Order.find(params[:order_id])

    Stripe.api_key = Rails.application.credentials[Rails.env.to_sym][:STRIPE_SK].to_s

    @payment = Stripe::PaymentIntent.retrieve(
                  @order.charge_id,
                )
    @charges = @payment['charges']['data'][0]
  end

  def success
  end

  def cancel
  end

  private
   def order_params
     params.require(:order).permit(:price_per_quantity, :quantity)
   end
end

class OrderMailer < Applicationailer

  def order_notification(product)
    @order = order
    @user = @order.user

    mail(to: @user.email, subject: "Your order summary")
  end
end

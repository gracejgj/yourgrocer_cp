class OrderMailer < Applicationailer

  def quantity_notification(product)
    @order = order
    @user = @order.user

    mail(to: @vendor.email, subject: "Your stock is LOW! ")
  end
end

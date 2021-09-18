class ProductsController < UsersController
  def show
    @products = Product.all.is_available
    @product = Product.find(params[:id])
    @order = Order.new
  end
end

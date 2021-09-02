class Platform::DashboardsController < PlatformController

  def show
    @product = Product.new
    @products = current_vendor.products
  end

end

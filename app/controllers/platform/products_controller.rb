class Platform::ProductsController < PlatformController

  def create
    @product = current_vendor.products.create(product_params)

    if @product.save
      redirect_to platform_dashboard_path(current_vendor), notice: 'Product was successfully created.'
    else
      redirect_to platform_dashboard_path(current_vendor), alert: 'There was an error. Please try again.'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)

    if @product.save
      redirect_to platform_dashboard_path(current_vendor), notice: 'Product was successfully updated.'
    else
      redirect_to platform_dashboard_path(current_vendor), alert: 'There was an error. Please try again.'
    end
  end

  def delete_photo_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to platform_dashboard_path(current_vendor), notice: 'Photo was successfully removed.'
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to platform_dashboard_path(current_vendor), notice: 'Product was successfully deleted.'
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price_per_quantity, :stock, :available, photos: [])
    end
end

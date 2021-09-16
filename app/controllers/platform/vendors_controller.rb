class Platform::VendorsController < PlatformController

  def show
    @vendor = Vendor.find(params[:id])
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_params)

    if @vendor.save
      redirect_to platform_vendor_path(current_vendor), notice: 'Vendor profile was successfully updated.'
    else
      render :edit
    end
  end

  private
    def vendor_params
      params.require(:vendor).permit(:email, :password, :avatar, :name, :phone_number, :location, :latitude, :longitude)
    end

end

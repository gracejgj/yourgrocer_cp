class Platform::UsersController < PlatformController

  def show
    @user = User.find(params[:id])
    @product = Product.find(params[:id])
  end

end

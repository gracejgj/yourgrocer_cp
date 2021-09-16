class Platform::UsersController < PlatformController

  def show
    @user = User.find(params[:id])
  end

end

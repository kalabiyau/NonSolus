class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
    redirect_to(users_url)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end

end

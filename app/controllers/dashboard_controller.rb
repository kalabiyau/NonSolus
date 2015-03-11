class DashboardController < ApplicationController

  respond_to :html

  def show
    @user = current_user if current_user
  end

  private

  def user_params
    params.require(:user).permit(:subscriber)
  end
end

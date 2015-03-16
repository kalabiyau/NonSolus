class DashboardController < ApplicationController

  respond_to :html

  private

  def user_params
    params.require(:user).permit(:subscriber)
  end
end

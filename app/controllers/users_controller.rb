class UsersController < ApplicationController

  def update
    if current_user.update_attributes(user_params)
      if current_user.subscriber
        flash[:notice] = 'You will now receive Notifications.'
      else
        flash[:notice] = 'You just unsubsribed.'
      end
    end
    redirect_to dashboard_url
  end

  protected

  def user_params
    params.require(:user).permit(:subscriber)
  end
end

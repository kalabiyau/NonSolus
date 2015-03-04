class UsersController < ApplicationController

  respond_to :html

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    if @current_user.update_attributes(user_params)
      if @current_user.subscriber
        flash[:success] = 'You will now receive Notifications.'
      else
        flash[:success] = 'You just unsubsribed.'
      end
    end
    respond_with(@user)
  end

  private

  def user_params
    params.require(:user).permit(:subscriber)
  end

end

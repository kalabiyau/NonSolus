class UsersController < ApplicationController

  respond_to :html

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update_attributes(user_params)
      if user_params['subscriber'] == 1
        flash[:success] = 'You will now receive Notifications.'
      else
        flash[:success] = 'You just unsubsribed.'
      end
    else
      flash[:warning] = 'Something went wrong'
    end
    respond_with(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:subscriber)
  end

end

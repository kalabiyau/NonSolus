class ActivitiesController < ApplicationController

  respond_to :html

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    flash[:success] = 'Successfully created Activity' if @activity.save
    send_mail
    respond_with(@activity)
  end

  def send_mail
    User.where(subscriber: true).each do |user|
      Notifier.notification(user.email).deliver_now
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to(activities_url)
  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end

end

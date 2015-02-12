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
    respond_with(@activity)
  end

  def show
    @activity = Activity.find(params[:id])
    respond_with(@activity)
  end

  def destroy

  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end
end

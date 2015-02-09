class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def destroy

  end

  private

  def activity_params
    params.require(:activity).permit(:name)
  end

end

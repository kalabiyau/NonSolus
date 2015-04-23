class CommentsController < ApplicationController

  before_filter :authorize_user!
  respond_to :js

  def create
    @activity = Activity.find(params[:activity_id])
    @comment = Comment.new(comment_params)
    @comment.activity = @activity
    @comment.user = current_user
    if @comment.save
      @comments = @activity.comments
      respond_with(@comments)
    else
      render :new
    end
  end

  protected

  def comment_params
    params.require(:comment).permit(:content)
  end
end

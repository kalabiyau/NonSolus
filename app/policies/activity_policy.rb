class ActivityPolicy < ApplicationPolicy
  attr_reader :user, :activity

  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def update?
    activity.creator == user
  end

  def leave?
    @activity.users.include?(@user)
  end

  def destroy?
    @activity.creator == @user
  end

  def join?
    @user && !@activity.users.include?(@user) &&
        !@activity.full? &&
            @activity.creator != @user
  end
end

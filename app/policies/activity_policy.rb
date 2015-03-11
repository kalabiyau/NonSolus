class ActivityPolicy < ApplicationPolicy
  attr_reader :user, :activity

  def initialize(user, activity)
    @user = user
    @activity = activity
  end

  def update?
    activity.creator == user
  end
end

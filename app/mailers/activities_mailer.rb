class ActivitiesMailer < ApplicationMailer

  def new_activities_digest(user)
    @user = user
    @recent_activities = Activity.last(50)
    mail(to: @user.email, subject: '[SUSE-ACT] New Activities Digest', return_path: generate_verp_pattern)
  end

end

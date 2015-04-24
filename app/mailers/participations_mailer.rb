class ParticipationsMailer < ApplicationMailer

  def notify_creator(activity, participant)
    @participant = participant
    @activity    = activity
    mail(to: @activity.creator.email, subject: '[SUSE-ACT] Mate joined your activity', return_path: generate_verp_pattern)
  end

end

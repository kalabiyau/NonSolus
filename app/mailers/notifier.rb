class Notifier < ApplicationMailer
  self.queue = MailerQueue.new

  default from: 'no-reply.act@suse.com',
          return_path: 'system.act@suse.com'

  def notification(recipient_id)
    @recipient = User.find(recipient_id)
    mail(to: @recipient.email,
         subject: '[SUSE - ACT] New Activity!'
         )
  end
end

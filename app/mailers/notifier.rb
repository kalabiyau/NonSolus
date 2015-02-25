class Notifier < ApplicationMailer

  default from: 'no-reply.act@suse.com',
          return_path: 'system.act@suse.com'

  def notification(recipient)
    @recipient = recipient
    mail(to: recipient,
         subject: '[SUSE - ACT] New Activity!'
         )
  end
end

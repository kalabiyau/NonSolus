class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@suse.de'
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default from: 'act@act.suse.de'
  layout 'mailer'

  def generate_verp_pattern
    return self.class.default[:from] unless @user
    default_from = Mail::Address.new(self.class.default[:from])
    verp = "#{default_from.local}+"
    verp << [Mail::Address.new(@user.email).local, Mail::Address.new(@user.email).domain].join('=')
    verp << "@#{default_from.domain}"
  end

end

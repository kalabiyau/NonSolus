class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    [ object.first_name, object.last_name ].join(' ')
  end

  def gravatar_url
    "//www.gravatar.com/avatar/#{Digest::MD5.hexdigest(object.email)}"
  end

end

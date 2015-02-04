class User < ActiveRecord::Base

  validate :first_name, :last_name, :email, :novell_username, :webid

  class << self

    def find_or_create_for_saml(data)
      user = User.where('lower(novell_username) = ?', data[:novell_username].downcase).first || User.new
      user.update_attributes!(data)
      user
    end

  end

end

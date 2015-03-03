require 'active_support/concern'

module ActivityConcern
  extend ActiveSupport::Concern

  class_methods do

    def send_new_activities_digest
      User.subscribers.find_each do |user|
        ActivitiesMailer.new_activities_digest(user).deliver_later
      end
    end

  end

end

class AddTimestampForActivity < ActiveRecord::Migration
  def change
    add_timestamps(:activities)
    Activity.find_each do |activity|
      activity.update_attribute(:updated_at, Time.zone.now)
      activity.update_attribute(:created_at, Time.zone.now)
    end
  end
end

class AddTimestampForActivity < ActiveRecord::Migration
  def change
    add_timestamps(:activities)
    Activity.find_each do |activity|
      activity.created_at = Time.zone.now
      activity.updated_at = Time.zone.now
      activity.save!
    end
  end
end

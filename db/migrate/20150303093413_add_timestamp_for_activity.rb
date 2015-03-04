class AddTimestampForActivity < ActiveRecord::Migration
  def change
    add_timestamps(:activities, null: false)
  end
end

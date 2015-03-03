class AddSubscriberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscriber, :boolean, default: false
  end
end

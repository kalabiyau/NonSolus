class AddCapacity < ActiveRecord::Migration
  def change
    add_column :activities, :capacity, :integer, index: true
    Activity.reset_column_information
    Activity.update_all(capacity: 0)
  end
end

class StoreCreatorInActivity < ActiveRecord::Migration
  def change
    add_reference :activities, :creator, index: true
  end
end

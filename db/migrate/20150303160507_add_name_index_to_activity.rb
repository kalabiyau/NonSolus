class AddNameIndexToActivity < ActiveRecord::Migration
  def change
    add_index :activities, :name
  end
end

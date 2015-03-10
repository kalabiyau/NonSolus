class AddUrgencyToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :urgent, :boolean, index: true
  end
end

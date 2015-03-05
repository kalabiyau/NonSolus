class AddDescriptionAttribute < ActiveRecord::Migration
  def change
    add_column :activities, :description, :text
  end
end

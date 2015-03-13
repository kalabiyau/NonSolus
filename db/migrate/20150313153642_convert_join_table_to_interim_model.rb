class ConvertJoinTableToInterimModel < ActiveRecord::Migration
  def change
    rename_table :activities_users, :participations
    add_column :participations, :id, :primary_key
    add_index :participations, :user_id
    add_index :participations, :activity_id
  end
end

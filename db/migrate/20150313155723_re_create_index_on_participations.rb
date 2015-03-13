class ReCreateIndexOnParticipations < ActiveRecord::Migration
  def change
    remove_index :participations, column: [:user_id, :activity_id]
    change_column :participations, :user_id, :integer, null: true
    change_column :participations, :activity_id, :integer, null: true
  end
end

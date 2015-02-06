class CreateJoinTableActivityUser < ActiveRecord::Migration
  def change
    create_join_table :activities, :users do |t|
      t.index [:user_id, :activity_id]
    end
  end
end

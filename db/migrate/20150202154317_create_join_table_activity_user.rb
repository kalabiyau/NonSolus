class CreateJoinTableActivityUser < ActiveRecord::Migration
  def change
    create_join_table :activities, :users do |t|
       t.index [:activity_id, :user_id]
       t.index [:user_id, :activity_id]
    end
  end
end

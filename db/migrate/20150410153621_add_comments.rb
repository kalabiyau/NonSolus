class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user
      t.references :activity
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :activity_id
  end
end

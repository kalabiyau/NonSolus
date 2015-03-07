class ChangeUserAttributes < ActiveRecord::Migration
  def change
    rename_column :users, :novell_username, :username
    rename_column :users, :webid, :workforceid
  end
end

class AddSamlDetailsForUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :novell_username, :string
    add_column :users, :webid, :string
  end
end

class AddCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
    add_column :activities, :category_id, :integer, index: true
  end
end

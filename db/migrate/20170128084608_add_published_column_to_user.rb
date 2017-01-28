class AddPublishedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :published, :boolean, default: true, null: false
  end
end

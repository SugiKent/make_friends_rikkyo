class AddComplitedColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :completed, :boolean, default: false, null: false
  end
end

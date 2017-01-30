class AddSexColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer, default: 2, null: false, limit: 1
  end
end

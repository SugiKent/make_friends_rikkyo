class AddWantFriendsColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :want_friends, :boolean, default: false, null: false
  end
end

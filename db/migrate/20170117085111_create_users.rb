class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :twitter_id
      t.boolean :published, default: 0

      t.timestamps null: false
    end
  end
end

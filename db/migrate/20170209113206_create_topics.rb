class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.string :belong_type
      t.integer :belong_id
      t.boolean :published, default: true

      t.timestamps null: false
    end
  end
end

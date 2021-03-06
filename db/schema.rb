# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170210094507) do

  create_table "circles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "category",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "department_name", limit: 255
    t.integer  "faculty_id",      limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "departments", ["faculty_id"], name: "index_departments_on_faculty_id", using: :btree

  create_table "faculties", force: :cascade do |t|
    t.string   "faculty_name", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "topic_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.string   "belong_type", limit: 255
    t.integer  "belong_id",   limit: 4
    t.boolean  "published",                 default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "topics", ["user_id"], name: "index_topics_on_user_id", using: :btree

  create_table "user_circles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "circle_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_circles", ["circle_id"], name: "index_user_circles_on_circle_id", using: :btree
  add_index "user_circles", ["user_id"], name: "index_user_circles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",      limit: 255
    t.string   "uid",           limit: 255
    t.string   "nickname",      limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "faculty_id",    limit: 4
    t.integer  "department_id", limit: 4
    t.string   "name",          limit: 255
    t.boolean  "completed",                 default: false, null: false
    t.boolean  "published",                 default: true,  null: false
    t.integer  "sex",           limit: 1,   default: 2,     null: false
    t.boolean  "want_friends",              default: false, null: false
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id", using: :btree
  add_index "users", ["faculty_id"], name: "index_users_on_faculty_id", using: :btree

  add_foreign_key "departments", "faculties"
  add_foreign_key "posts", "topics"
  add_foreign_key "posts", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "user_circles", "circles"
  add_foreign_key "user_circles", "users"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "faculties"
end

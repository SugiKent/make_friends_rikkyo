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

ActiveRecord::Schema.define(version: 20170118055720) do

  create_table "departments", force: :cascade do |t|
    t.string   "department_name"
    t.integer  "faculty_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departments", ["faculty_id"], name: "index_departments_on_faculty_id"

  create_table "faculties", force: :cascade do |t|
    t.string   "faculty_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "twitter_id"
    t.boolean  "published",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "department_id"
    t.integer  "faculty_id"
  end

  add_index "users", ["department_id"], name: "index_users_on_department_id"
  add_index "users", ["faculty_id"], name: "index_users_on_faculty_id"

end

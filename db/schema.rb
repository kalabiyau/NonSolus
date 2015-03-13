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

ActiveRecord::Schema.define(version: 20150313155723) do

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "creator_id"
    t.boolean  "urgent"
  end

  add_index "activities", ["creator_id"], name: "index_activities_on_creator_id"
  add_index "activities", ["name"], name: "index_activities_on_name"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
    t.string   "icon"
  end

  create_table "participations", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "user_id"
  end

  add_index "participations", ["activity_id"], name: "index_participations_on_activity_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "email"
    t.string  "username"
    t.string  "workforceid"
    t.boolean "subscriber",  default: false
  end

end

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

ActiveRecord::Schema.define(version: 20171012205846) do

  create_table "dorms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "draw_periods", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "floor"
    t.string "number"
    t.integer "capacity"
    t.integer "dorm_id"
    t.integer "suite_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dorm_id"], name: "index_rooms_on_dorm_id"
    t.index ["suite_id"], name: "index_rooms_on_suite_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.integer "class"
    t.integer "room_draw_number"
    t.boolean "has_participated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_students_on_room_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "suites", force: :cascade do |t|
    t.string "name"
    t.integer "dorm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dorm_id"], name: "index_suites_on_dorm_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "is_ashmc_admin"
    t.boolean "is_super_admin"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

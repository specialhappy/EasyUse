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

ActiveRecord::Schema.define(version: 20141109073179) do

  create_table "a_level_tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "application_forms", force: true do |t|
    t.text     "experiment_description"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", force: true do |t|
    t.string   "date"
    t.string   "time"
    t.string   "price_paid"
    t.decimal  "fee"
    t.datetime "submit_time"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "instrument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "b_level_tags", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "a_level_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "b_level_tags_instruments", id: false, force: true do |t|
    t.integer "instrument_id"
    t.integer "b_level_tag_id"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "create_time"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  create_table "institutions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.integer  "region_center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.string   "model"
    t.decimal  "price"
    t.string   "img_url"
    t.text     "description"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "from"
    t.text     "content"
    t.datetime "send_time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_logs", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "appointment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priviliges", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priviliges_roles", id: false, force: true do |t|
    t.integer "role_id"
    t.integer "privilige_id"
  end

  create_table "region_centers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_periods", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "card_number"
    t.string   "name"
    t.string   "password"
    t.string   "sex"
    t.string   "id_number"
    t.string   "phone"
    t.string   "picture"
    t.string   "email"
    t.string   "address"
    t.integer  "login_number"
    t.datetime "last_login_time"
    t.string   "status"
    t.integer  "role_id"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_records", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "content"
    t.integer  "operation_log_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

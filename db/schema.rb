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

ActiveRecord::Schema.define(version: 20140319092245) do

  create_table "branches", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "contact_person"
    t.string   "contact_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.integer  "models_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_movements", force: true do |t|
    t.string   "title"
    t.datetime "from_time"
    t.datetime "to_time"
    t.integer  "km_before"
    t.integer  "km_after"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_id"
    t.integer  "driver_id"
  end

  add_index "car_movements", ["car_id"], name: "index_car_movements_on_car_id"
  add_index "car_movements", ["driver_id"], name: "index_car_movements_on_driver_id"

  create_table "cars", force: true do |t|
    t.string   "name"
    t.string   "file_id"
    t.string   "model_year"
    t.string   "licence_no"
    t.string   "chase_no"
    t.string   "color"
    t.integer  "motor_size"
    t.date     "expiration_date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "kilomiters"
    t.integer  "model_id"
    t.string   "board_number"
  end

  add_index "cars", ["model_id"], name: "index_cars_on_model_id"

  create_table "drivers", force: true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "national_id"
    t.string   "driving_licence_no"
    t.date     "expiration_date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "telephone"
  end

  create_table "maintenance_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", force: true do |t|
    t.string   "title"
    t.text     "purpose"
    t.integer  "cost"
    t.string   "center_name"
    t.text     "center_address"
    t.string   "center_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_id"
    t.integer  "maintenance_category_id"
  end

  add_index "maintenances", ["car_id"], name: "index_maintenances_on_car_id"
  add_index "maintenances", ["maintenance_category_id"], name: "index_maintenances_on_maintenance_category_id"

  create_table "models", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brand_id"
    t.integer  "cars_count", default: 0, null: false
  end

  add_index "models", ["brand_id"], name: "index_models_on_brand_id"

  create_table "users", force: true do |t|
    t.string   "crypted_password",          limit: 40
    t.string   "salt",                      limit: 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                default: "inactive"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], name: "index_users_on_state"

end

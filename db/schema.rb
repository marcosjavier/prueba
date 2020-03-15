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

ActiveRecord::Schema.define(version: 20191014130126) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "tradename"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "type_of_device"
    t.string   "observations"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "admission_date"
    t.date     "discharge_date"
    t.integer  "service_order_id"
  end

  add_index "devices", ["service_order_id"], name: "index_devices_on_service_order_id"

  create_table "maintenances", force: :cascade do |t|
    t.string   "observations"
    t.date     "pending_date"
    t.date     "maintenance_date_made"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "status"
    t.integer  "customer_id"
  end

  add_index "maintenances", ["customer_id"], name: "index_maintenances_on_customer_id"

  create_table "movements", force: :cascade do |t|
    t.string   "work_done"
    t.string   "computer_supplies"
    t.string   "observations"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "service_order_id"
    t.integer  "device_id"
  end

  add_index "movements", ["device_id"], name: "index_movements_on_device_id"
  add_index "movements", ["service_order_id"], name: "index_movements_on_service_order_id"

  create_table "service_orders", force: :cascade do |t|
    t.date     "last_move_date_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "reported_problem"
    t.integer  "status_id"
  end

  add_index "service_orders", ["customer_id"], name: "index_service_orders_on_customer_id"
  add_index "service_orders", ["status_id"], name: "index_service_orders_on_status_id"

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

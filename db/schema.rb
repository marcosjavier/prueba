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

ActiveRecord::Schema.define(version: 20190710225401) do

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "surname",    limit: 255
    t.string   "tradename",  limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",      limit: 255
  end

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

  create_table "service_orders", force: :cascade do |t|
    t.date     "last_move_date_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "state_id"
  end

  add_index "service_orders", ["customer_id"], name: "index_service_orders_on_customer_id"
  add_index "service_orders", ["state_id"], name: "index_service_orders_on_state_id"

  create_table "states", force: :cascade do |t|
    t.string   "state",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

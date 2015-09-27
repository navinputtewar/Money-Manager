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

ActiveRecord::Schema.define(version: 20150926104336) do

  create_table "expence_categories", force: :cascade do |t|
    t.string   "expence_source", limit: 255
    t.string   "description",    limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "expence_categories", ["user_id"], name: "index_expence_categories_on_user_id", using: :btree

  create_table "expences", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "amount",     limit: 255
    t.date     "date"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "expences", ["user_id"], name: "index_expences_on_user_id", using: :btree

  create_table "income_categories", force: :cascade do |t|
    t.string   "income_source", limit: 255
    t.string   "description",   limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "income_categories", ["user_id"], name: "index_income_categories_on_user_id", using: :btree

  create_table "incomes", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.string   "amount",     limit: 255
    t.date     "date"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "incomes", ["user_id"], name: "index_incomes_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.date     "date"
    t.string   "from",           limit: 255
    t.string   "to",             limit: 255
    t.string   "amount",         limit: 255
    t.string   "description",    limit: 255
    t.integer  "transable_id",   limit: 4
    t.string   "transable_type", limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "transactions", ["transable_type", "transable_id"], name: "index_transactions_on_transable_type_and_transable_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "expence_categories", "users"
  add_foreign_key "expences", "users"
  add_foreign_key "income_categories", "users"
  add_foreign_key "incomes", "users"
  add_foreign_key "transactions", "users"
end

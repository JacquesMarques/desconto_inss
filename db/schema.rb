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

ActiveRecord::Schema.define(version: 20231101141448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street",       null: false
    t.string   "number",       null: false
    t.string   "neighborhood"
    t.string   "city",         null: false
    t.string   "state",        null: false
    t.string   "zipcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "proponents", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.string   "document",                                  null: false
    t.date     "birthday"
    t.integer  "address_id",                                null: false
    t.string   "personal_phone"
    t.string   "references_phone"
    t.decimal  "salary",           precision: 10, scale: 2, null: false
    t.decimal  "inss_discount",    precision: 10, scale: 2, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["address_id"], name: "index_proponents_on_address_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "proponents", "addresses"
end

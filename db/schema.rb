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

ActiveRecord::Schema.define(version: 20140919182425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concerts", force: true do |t|
    t.string   "headliner"
    t.datetime "date"
    t.integer  "promoter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  add_index "concerts", ["venue_id"], name: "index_concerts_on_venue_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.integer  "promoter_id"
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["invitation_token"], name: "index_employees_on_invitation_token", unique: true, using: :btree
  add_index "employees", ["invitations_count"], name: "index_employees_on_invitations_count", using: :btree
  add_index "employees", ["invited_by_id"], name: "index_employees_on_invited_by_id", using: :btree
  add_index "employees", ["promoter_id"], name: "index_employees_on_promoter_id", using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree

  create_table "expense_categories", force: true do |t|
    t.string   "name"
    t.integer  "promoter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expense_categories", ["promoter_id"], name: "index_expense_categories_on_promoter_id", using: :btree

  create_table "expenses", force: true do |t|
    t.string   "name"
    t.integer  "expected_cost"
    t.integer  "actual_cost"
    t.boolean  "viewable_by_employee"
    t.integer  "concert_id"
    t.integer  "expense_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["concert_id"], name: "index_expenses_on_concert_id", using: :btree
  add_index "expenses", ["expense_category_id"], name: "index_expenses_on_expense_category_id", using: :btree

  create_table "promoters", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "company"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "venue_id"
    t.integer  "employee_id"
  end

  add_index "promoters", ["email"], name: "index_promoters_on_email", unique: true, using: :btree
  add_index "promoters", ["employee_id"], name: "index_promoters_on_employee_id", using: :btree
  add_index "promoters", ["reset_password_token"], name: "index_promoters_on_reset_password_token", unique: true, using: :btree
  add_index "promoters", ["venue_id"], name: "index_promoters_on_venue_id", using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "contact_name"
    t.string   "contact_number"
    t.integer  "promoter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

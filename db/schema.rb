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

ActiveRecord::Schema.define(version: 20160507154500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "street"
    t.string   "exterior_number"
    t.string   "interior_number"
    t.string   "county"
    t.string   "state"
    t.string   "city"
    t.string   "delegation"
    t.string   "zip_code"
    t.string   "country"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "client_id"
  end

  add_index "addresses", ["deleted_at"], name: "index_addresses_on_deleted_at", using: :btree
  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "marital_status",   default: 0
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.datetime "birth_date"
    t.integer  "gender"
    t.string   "email"
    t.string   "phone_number"
    t.string   "cellphone_number"
    t.boolean  "has_kids",         default: false
    t.boolean  "is_vip",           default: false
    t.datetime "client_since"
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "client_prospect",  default: false
    t.boolean  "real_client",      default: false
  end

  add_index "clients", ["deleted_at"], name: "index_clients_on_deleted_at", using: :btree
  add_index "clients", ["user_id"], name: "index_clients_on_user_id", using: :btree

  create_table "comissions", force: :cascade do |t|
    t.float    "first_year"
    t.float    "second_year"
    t.float    "third_year"
    t.float    "fourth_year"
    t.float    "fifth_year"
    t.float    "post_fifth_year"
    t.float    "base_prime"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "policy_id"
  end

  add_index "comissions", ["deleted_at"], name: "index_comissions_on_deleted_at", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "companies", ["deleted_at"], name: "index_companies_on_deleted_at", using: :btree

  create_table "company_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "agent_number"
    t.string   "user_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "protal_url"
    t.boolean  "has_promotoria",           default: false
    t.string   "number_promotoria"
    t.string   "name_promotoria_contact"
    t.string   "phone_promotoria_contact"
    t.string   "email_promotoria_contact"
    t.boolean  "has_company",              default: false
    t.string   "number_company"
    t.string   "name_company_contact"
    t.string   "phone_company_contact"
    t.string   "email_company_contact"
    t.datetime "deleted_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id", using: :btree
  add_index "company_users", ["deleted_at"], name: "index_company_users_on_deleted_at", using: :btree
  add_index "company_users", ["user_id"], name: "index_company_users_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "relationship", default: 0
    t.datetime "event_date"
    t.text     "notes"
    t.datetime "deleted_at"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree
  add_index "events", ["deleted_at"], name: "index_events_on_deleted_at", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "notification_type"
    t.boolean  "read",              default: false
    t.text     "description"
    t.datetime "deleted_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "notifications", ["deleted_at"], name: "index_notifications_on_deleted_at", using: :btree
  add_index "notifications", ["event_id"], name: "index_notifications_on_event_id", using: :btree

  create_table "offsprings", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.datetime "birth_date"
    t.integer  "gender"
    t.datetime "deleted_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "offsprings", ["client_id"], name: "index_offsprings_on_client_id", using: :btree
  add_index "offsprings", ["deleted_at"], name: "index_offsprings_on_deleted_at", using: :btree

  create_table "policies", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "policy_type"
    t.integer  "renewal_method"
    t.integer  "payment_method"
    t.string   "policy_number"
    t.datetime "issued_date"
    t.datetime "expiration_date"
    t.string   "product_name"
    t.datetime "deleted_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "company_id"
  end

  add_index "policies", ["client_id"], name: "index_policies_on_client_id", using: :btree
  add_index "policies", ["deleted_at"], name: "index_policies_on_deleted_at", using: :btree

  create_table "prospects", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "company_id"
    t.string   "product_type"
    t.integer  "payment_method"
    t.datetime "end_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "prospects", ["client_id"], name: "index_prospects_on_client_id", using: :btree
  add_index "prospects", ["company_id"], name: "index_prospects_on_company_id", using: :btree

  create_table "referrals", force: :cascade do |t|
    t.integer  "referrer_id"
    t.integer  "referee_id"
    t.datetime "deleted_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "email"
  end

  add_index "referrals", ["deleted_at"], name: "index_referrals_on_deleted_at", using: :btree
  add_index "referrals", ["referee_id"], name: "index_referrals_on_referee_id", using: :btree
  add_index "referrals", ["referrer_id"], name: "index_referrals_on_referrer_id", using: :btree

  create_table "spouses", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.datetime "birth_date"
    t.datetime "married_date"
    t.integer  "gender"
    t.datetime "deleted_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "spouses", ["client_id"], name: "index_spouses_on_client_id", using: :btree
  add_index "spouses", ["deleted_at"], name: "index_spouses_on_deleted_at", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                      default: "",   null: false
    t.string   "encrypted_password",         default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "locale",                     default: "en"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "last_name"
    t.string   "second_last_name"
    t.string   "phone_number"
    t.integer  "user_type",                  default: 0
    t.datetime "deleted_at"
    t.string   "resp_civil_policy_company"
    t.string   "resp_civil_policy_number"
    t.datetime "resp_civil_policy_end_date"
    t.string   "secondary_email"
    t.string   "legal_entity"
    t.string   "business_name"
    t.string   "user_rfc"
    t.string   "email_invoice"
    t.integer  "status",                     default: 0
  end

  add_index "users", ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

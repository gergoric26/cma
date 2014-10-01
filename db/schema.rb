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

ActiveRecord::Schema.define(version: 20140424034159) do

  create_table "contacts", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "streetAddress"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phoneNumber"
    t.string   "alternatePhoneNumber"
    t.text     "comments"
    t.string   "birthday"
    t.string   "uploadDocuments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id"

  create_table "meetings", force: true do |t|
    t.string   "purpose"
    t.string   "attendance"
    t.string   "timeAndDate"
    t.string   "location"
    t.text     "notes"
    t.string   "uploadDocuments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
  end

  add_index "meetings", ["contact_id"], name: "index_meetings_on_contact_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

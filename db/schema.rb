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

ActiveRecord::Schema.define(version: 20140705014015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: true do |t|
    t.string   "pdf_url"
    t.integer  "theme"
    t.string   "qr_code_link"
    t.string   "photo"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "work_ex_position"
    t.string   "work_ex_company"
    t.string   "website_url"
    t.string   "phone"
    t.string   "email"
    t.string   "resume_id"
    t.string   "twitter_url"
    t.string   "linkedin_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.string   "college"
    t.string   "degree"
    t.string   "start_duration"
    t.string   "end_duration"
    t.string   "description"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extra_fields", force: true do |t|
    t.string   "field_name"
    t.string   "description"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "linked_in_url"
    t.string   "twitter_url"
    t.string   "description"
    t.string   "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  create_table "resumes", force: true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.integer  "theme"
    t.string   "url"
    t.integer  "view_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "twitter_username"
    t.string   "facebook_url"
    t.string   "bio"
    t.string   "linked_in_url"
  end

  create_table "skills", force: true do |t|
    t.string   "description"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_experiences", force: true do |t|
    t.string   "company"
    t.string   "position"
    t.string   "start_duration"
    t.string   "end_duration"
    t.string   "description"
    t.integer  "resume_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20170204200754) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "login",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "password_salt",      default: "", null: false
    t.integer  "role_id"
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "admin_users", ["login"], name: "index_admin_users_on_login", unique: true
  add_index "admin_users", ["role_id"], name: "index_admin_users_on_role_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "invites", force: :cascade do |t|
    t.integer  "team_id",      null: false
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.boolean  "accepted"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "match_begins"
    t.string   "agora_link"
    t.string   "password"
    t.string   "status",        default: "not happened", null: false
    t.integer  "tournament_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "matches", ["status"], name: "index_matches_on_status"

  create_table "matches_teams", id: false, force: :cascade do |t|
    t.integer "match_id"
    t.integer "team_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",              null: false
    t.text     "content",            null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "author_id",          null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "posts", ["title"], name: "index_posts_on_title"

  create_table "teams", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["full_name"], name: "index_teams_on_full_name", unique: true
  add_index "teams", ["tag_name"], name: "index_teams_on_tag_name", unique: true

  create_table "teams_tournaments", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "tournament_id"
  end

  create_table "teams_users", id: false, force: :cascade do |t|
    t.integer "team_id"
    t.integer "user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "title",                             null: false
    t.integer  "max_team",                          null: false
    t.integer  "payment"
    t.integer  "prize"
    t.integer  "team_id"
    t.integer  "match_id"
    t.integer  "user_id"
    t.boolean  "end",               default: false
    t.datetime "tournament_begins",                 null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "tournaments", ["max_team"], name: "index_tournaments_on_max_team"
  add_index "tournaments", ["payment"], name: "index_tournaments_on_payment"
  add_index "tournaments", ["prize"], name: "index_tournaments_on_prize"

  create_table "tournaments_users", id: false, force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "accountId",  null: false
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end

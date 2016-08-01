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

ActiveRecord::Schema.define(version: 20160621103950) do

  create_table "invites", force: :cascade do |t|
    t.integer  "team_id",      null: false
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
    t.boolean  "accepted"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "date_match", null: false
    t.integer  "teamId_1",   null: false
    t.integer  "teamId_2",   null: false
    t.string   "agora_link", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "text",       null: false
    t.integer  "autorId",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "country"
    t.integer  "rating"
    t.string   "image"
    t.integer  "captainId",  null: false
    t.integer  "playersId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.boolean  "end",               default: false
    t.datetime "tournament_begins",                 null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "played_matches"
    t.integer  "win"
    t.integer  "lose"
    t.integer  "kda"
    t.integer  "team_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end

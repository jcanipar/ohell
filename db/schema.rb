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

ActiveRecord::Schema.define(version: 20190301110454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: true do |t|
    t.string   "name"
    t.float    "weight"
    t.integer  "min_players"
    t.integer  "max_players"
    t.integer  "min_time"
    t.integer  "max_time"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bgg_id"
    t.string   "bgg_thumb"
    t.string   "bgg_image"
  end

  create_table "gamers", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "games", force: true do |t|
    t.datetime "date"
    t.integer  "numplay",     limit: 8
    t.boolean  "league"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "backwards"
    t.boolean  "notrump"
  end

  create_table "games", force: true do |t|
    t.datetime "date"
    t.integer  "numplay",     limit: 8
    t.boolean  "league"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.boolean  "backwards"
    t.boolean  "notrump"
  end

  create_table "hands", force: true do |t|
    t.integer  "bid",        limit: 8
    t.integer  "got",        limit: 8
    t.integer  "player_id",  limit: 8
    t.integer  "round_num",  limit: 8
    t.integer  "game_id",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hands", force: true do |t|
    t.integer  "bid",        limit: 8
    t.integer  "got",        limit: 8
    t.integer  "player_id",  limit: 8
    t.integer  "round_num",  limit: 8
    t.integer  "game_id",    limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.date     "date"
    t.integer  "players"
    t.text     "notes"
    t.integer  "week"
    t.integer  "location_id"
    t.integer  "box_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.boolean  "team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.boolean  "team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.boolean  "team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "nickname"
    t.boolean  "team"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "game_id",    limit: 8
    t.integer  "score",      limit: 8
    t.integer  "place",      limit: 8
    t.integer  "correct",    limit: 8
    t.integer  "asterisk",   limit: 8
    t.integer  "player_id",  limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "game_id",    limit: 8
    t.integer  "score",      limit: 8
    t.integer  "place",      limit: 8
    t.integer  "correct",    limit: 8
    t.integer  "asterisk",   limit: 8
    t.integer  "player_id",  limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", force: true do |t|
    t.integer  "match_id"
    t.integer  "gamer_id"
    t.float    "score"
    t.integer  "place"
    t.float    "league_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 8,              null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "idx_16553_index_users_on_email", unique: true, using: :btree
  add_index "users", ["email"], name: "idx_16627_index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "idx_16553_index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "idx_16627_index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 8,              null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "idx_16553_index_users_on_email", unique: true, using: :btree
  add_index "users", ["email"], name: "idx_16627_index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "idx_16553_index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "idx_16627_index_users_on_reset_password_token", unique: true, using: :btree

end

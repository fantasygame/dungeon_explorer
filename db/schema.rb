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

ActiveRecord::Schema.define(version: 20150830145146) do

  create_table "characters", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "experience", limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "characters", ["team_id"], name: "index_characters_on_team_id", using: :btree

  create_table "equipment", force: :cascade do |t|
    t.string "name",                        limit: 100,        default: "", null: false
    t.string "family",                      limit: 255,        default: ""
    t.string "category",                    limit: 255,        default: ""
    t.string "subcategory",                 limit: 255,        default: ""
    t.string "cost",                        limit: 255,        default: ""
    t.string "dmg_s",                       limit: 255,        default: ""
    t.string "armor_shield_bonus",          limit: 255,        default: ""
    t.string "maximum_dex_bonus",           limit: 255,        default: ""
    t.string "dmg_m",                       limit: 255,        default: ""
    t.string "weight",                      limit: 255,        default: ""
    t.string "critical",                    limit: 255,        default: ""
    t.string "armor_check_penalty",         limit: 255,        default: ""
    t.string "arcane_spell_failure_chance", limit: 255,        default: ""
    t.string "range_increment",             limit: 255,        default: ""
    t.string "speed_30",                    limit: 255,        default: ""
    t.string "damage_type",                 limit: 255
    t.string "speed_20",                    limit: 255,        default: ""
    t.text   "full_text",                   limit: 4294967295
    t.string "reference",                   limit: 255,        default: ""
    t.string "third_category",              limit: 255
  end

  add_index "equipment", ["id"], name: "id", using: :btree
  add_index "equipment", ["name"], name: "name", using: :btree

  create_table "items", force: :cascade do |t|
    t.string  "name",             limit: 100,        default: "", null: false
    t.string  "category",         limit: 255,        default: ""
    t.string  "subcategory",      limit: 255,        default: ""
    t.string  "special_ability",  limit: 255,        default: ""
    t.string  "aura",             limit: 255,        default: ""
    t.string  "caster_level",     limit: 255,        default: ""
    t.integer "price",            limit: 4
    t.string  "manifester_level", limit: 255,        default: ""
    t.text    "prereq",           limit: 4294967295
    t.string  "cost",             limit: 255,        default: ""
    t.string  "weight",           limit: 255,        default: ""
    t.text    "full_text",        limit: 4294967295
    t.string  "reference",        limit: 255,        default: ""
    t.boolean "enchantment"
    t.string  "special_category", limit: 255
  end

  add_index "items", ["id"], name: "id", using: :btree
  add_index "items", ["name"], name: "name", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "monster", force: :cascade do |t|
    t.string "family",            limit: 255,        default: ""
    t.string "name",              limit: 100,        default: "", null: false
    t.string "altname",           limit: 255,        default: ""
    t.string "size",              limit: 255,        default: ""
    t.string "genre",             limit: 255
    t.string "descriptor",        limit: 255,        default: ""
    t.string "hit_dice",          limit: 255,        default: ""
    t.string "initiative",        limit: 255,        default: ""
    t.string "speed",             limit: 255,        default: ""
    t.string "armor_class",       limit: 255,        default: ""
    t.string "base_attack",       limit: 255,        default: ""
    t.string "grapple",           limit: 255,        default: ""
    t.string "attack",            limit: 255,        default: ""
    t.text   "full_attack",       limit: 4294967295
    t.string "space",             limit: 255,        default: ""
    t.string "reach",             limit: 255,        default: ""
    t.string "special_attacks",   limit: 255,        default: ""
    t.text   "special_qualities", limit: 4294967295
    t.string "saves",             limit: 255,        default: ""
    t.string "abilities",         limit: 255,        default: ""
    t.text   "skills",            limit: 4294967295
    t.string "bonus_feats",       limit: 255,        default: ""
    t.text   "feats",             limit: 4294967295
    t.text   "epic_feats",        limit: 4294967295
    t.string "environment",       limit: 255,        default: ""
    t.text   "organization",      limit: 4294967295
    t.string "challenge_rating",  limit: 255,        default: ""
    t.string "treasure",          limit: 255,        default: ""
    t.string "alignment",         limit: 255,        default: ""
    t.string "advancement",       limit: 255,        default: ""
    t.string "level_adjustment",  limit: 255,        default: ""
    t.text   "special_abilities", limit: 4294967295
    t.text   "stat_block",        limit: 4294967295
    t.text   "full_text",         limit: 4294967295
    t.string "reference",         limit: 255,        default: ""
  end

  add_index "monster", ["id"], name: "id", using: :btree
  add_index "monster", ["name"], name: "name", using: :btree

  create_table "team_items", force: :cascade do |t|
    t.integer  "team_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "money",      limit: 4,   default: 0
  end

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
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "characters", "teams"
end

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

ActiveRecord::Schema.define(version: 20160112100820) do

  create_table "candidates", force: true do |t|
    t.string "name"
  end

  create_table "parties", force: true do |t|
    t.string "name"
  end

  create_table "party_members", force: true do |t|
    t.integer "party_id"
    t.string  "name"
  end

  add_index "party_members", ["party_id"], name: "index_party_members_on_party_id", using: :btree

  create_table "recapitulations", force: true do |t|
    t.integer "entity_id"
    t.string  "entity_type"
    t.integer "sub_districts_id"
    t.string  "voice"
    t.string  "description"
  end

  add_index "recapitulations", ["entity_id", "entity_type"], name: "index_recapitulations_on_entity_id_and_entity_type", using: :btree
  add_index "recapitulations", ["entity_id"], name: "index_recapitulations_on_entity_id", using: :btree
  add_index "recapitulations", ["entity_type"], name: "index_recapitulations_on_entity_type", using: :btree
  add_index "recapitulations", ["sub_districts_id"], name: "index_recapitulations_on_sub_districts_id", using: :btree

  create_table "sub_districts", force: true do |t|
    t.string "name"
  end

end

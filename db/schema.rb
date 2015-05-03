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

ActiveRecord::Schema.define(version: 20150503192811) do

  create_table "artist_events", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artist_genres", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.integer  "event_count"
    t.string   "name"
    t.integer  "seat_geek_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "seat_geek_id"
    t.integer  "listing_count"
    t.float    "average_price"
    t.float    "lowest_price"
    t.float    "highest_price"
    t.string   "title"
    t.datetime "datetime_local"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "venue_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "city"
    t.string   "name"
    t.string   "extended_address"
    t.string   "display_location"
    t.string   "state"
    t.integer  "postal_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "seat_geek_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end

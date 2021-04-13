# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_13_030957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stops", force: :cascade do |t|
    t.float "lat"
    t.float "lon"
    t.string "name"
    t.string "address"
    t.string "category"
    t.text "photo1"
    t.text "photo2"
    t.text "photo3"
    t.integer "visit_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_stops", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "stop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stop_id"], name: "index_trip_stops_on_stop_id"
    t.index ["trip_id"], name: "index_trip_stops_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "duration"
    t.float "start_lat"
    t.float "start_lon"
    t.string "status"
    t.integer "current_stop"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "trip_stops", "stops"
  add_foreign_key "trip_stops", "trips"
end

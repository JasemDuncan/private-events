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

ActiveRecord::Schema.define(version: 2020_10_02_174527) do

  create_table "Events", force: :cascade do |t|
    t.text "name"
    t.text "organizer"
    t.text "description"
    t.text "typeof"
    t.text "category"
    t.text "tags"
    t.date "datestart"
    t.date "dateend"
    t.time "timestart"
    t.time "timeend"
    t.integer "attendees"
    t.string "location"
    t.string "image"
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cover_file_name"
    t.string "cover_content_type"
    t.bigint "cover_file_size"
    t.datetime "cover_updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "us", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "permission_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_us_on_email", unique: true
    t.index ["reset_password_token"], name: "index_us_on_reset_password_token", unique: true
  end

  create_table "usevents", force: :cascade do |t|
    t.integer "u_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_usevents_on_event_id"
    t.index ["u_id"], name: "index_usevents_on_u_id"
  end

  add_foreign_key "usevents", "events"
  add_foreign_key "usevents", "us"
end

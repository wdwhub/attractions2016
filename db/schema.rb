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

ActiveRecord::Schema.define(version: 20160813182933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "touringplans_cached_venues", force: :cascade do |t|
    t.string   "name"
    t.boolean  "fastpass_booth"
    t.string   "short_name"
    t.boolean  "open_emh_morning"
    t.boolean  "open_emh_evening"
    t.boolean  "single_rider"
    t.string   "time_zone"
    t.boolean  "seasonal"
    t.boolean  "open_very_merry"
    t.boolean  "open_not_so_scary"
    t.string   "category_code"
    t.decimal  "duration"
    t.string   "scheduled_code"
    t.string   "what_it_is"
    t.string   "scope_and_scale_code"
    t.string   "when_to_go"
    t.string   "average_wait_per_hundred"
    t.string   "average_wait_assumes"
    t.string   "loading_speed"
    t.string   "probable_wait_time"
    t.string   "special_needs"
    t.string   "height_restriction"
    t.boolean  "intense"
    t.datetime "extinct_on"
    t.datetime "opened_on"
    t.boolean  "frightening"
    t.boolean  "physical_considerations"
    t.boolean  "handheld_captioning"
    t.boolean  "video_captioning"
    t.boolean  "reflective_captioning"
    t.boolean  "assistive_listening"
    t.boolean  "audio_description"
    t.string   "wheelchair_transfer_code"
    t.boolean  "no_service_animals"
    t.boolean  "sign_language"
    t.boolean  "service_animal_check"
    t.boolean  "not_to_be_missed"
    t.boolean  "rider_swap"
    t.string   "ultimate_code"
    t.string   "ultimate_task"
    t.string   "park_entrance"
    t.string   "relative_open"
    t.string   "relative_close"
    t.boolean  "close_at_dusk"
    t.boolean  "fastpass_available"
    t.integer  "crowd_calendar_version"
    t.string   "match_name"
    t.integer  "crazy_threshold"
    t.boolean  "fastpass_only"
    t.boolean  "allow_showtimes_after_close"
    t.boolean  "disconnected_fastpass_booth"
    t.integer  "crowd_calendar_group"
    t.string   "arrive_before"
    t.string   "arrive_before_fp"
    t.boolean  "opens_at_sunset"
    t.boolean  "closes_at_sunset"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "permalink"
  end

end

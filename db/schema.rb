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

ActiveRecord::Schema.define(version: 20171027030737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "cached_attractions", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
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
    t.string   "close_at_dusk"
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
    t.boolean  "allow_time_restriction"
    t.boolean  "relative_open_to_sunset"
    t.boolean  "relative_close_to_sunset"
    t.integer  "closing_round_code"
    t.integer  "walking_time_proxy_id"
    t.boolean  "flexible_duration"
    t.integer  "operator_id"
    t.string   "operator_type"
    t.integer  "showtime_proxy_id"
    t.boolean  "hide_app"
  end

  create_table "cached_photos", force: :cascade do |t|
    t.integer  "height"
    t.integer  "created_at_by_epoch"
    t.integer  "width"
    t.string   "foursquare_venue_id"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "fousquare_user"
    t.string   "visibility"
    t.string   "foursquare_photo_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "cached_tips", force: :cascade do |t|
    t.string   "foursquare_tip_id"
    t.text     "text"
    t.string   "kind"
    t.text     "canonical_url"
    t.string   "lang"
    t.string   "likes_count"
    t.string   "log_view"
    t.string   "agree_count"
    t.integer  "foursquare_user_id"
    t.string   "foursquare_user_first_name"
    t.string   "foursquare_last_name"
    t.string   "foursquare_user_gender"
    t.string   "foursquare_user_photo_prefix"
    t.string   "foursquare_user_photo_suffix"
    t.string   "foursquare_venue_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

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

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "frequency"
    t.string   "at"
    t.string   "job_name"
    t.jsonb    "job_arguments"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "foursquare_cached_venues", force: :cascade do |t|
    t.string   "name"
    t.string   "foursquare_venue_id"
    t.string   "address"
    t.string   "cross_street"
    t.string   "lat"
    t.string   "lng"
    t.string   "alt_venues"
    t.string   "searched_for"
    t.text     "categories"
    t.string   "referral_id"
    t.text     "location"
    t.text     "canonical_url"
    t.boolean  "verified"
    t.boolean  "dislike"
    t.boolean  "ok"
    t.decimal  "rating"
    t.string   "rating_signals"
    t.string   "rating_color"
    t.boolean  "allow_menu_url_edit"
    t.string   "specials"
    t.text     "wdw_uri"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "cached_attraction_id"
    t.index ["cached_attraction_id"], name: "index_foursquare_cached_venues_on_cached_attraction_id", using: :btree
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
    t.boolean  "allow_time_restriction"
    t.boolean  "relative_open_to_sunset"
    t.boolean  "relative_close_to_sunset"
    t.integer  "closing_round_code"
    t.integer  "walking_time_proxy_id"
    t.boolean  "flexible_duration"
    t.integer  "operator_id"
    t.string   "operator_type"
    t.integer  "showtime_proxy_id"
    t.boolean  "hide_app"
  end

  add_foreign_key "foursquare_cached_venues", "cached_attractions"
end

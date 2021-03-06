class CreateTouringplansCachedVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :touringplans_cached_venues do |t|
      t.string :name
      t.boolean :fastpass_booth
      t.string :short_name
      t.boolean :open_emh_morning
      t.boolean :open_emh_evening
      t.boolean :single_rider
      t.string :time_zone
      t.boolean :seasonal
      t.boolean :open_very_merry
      t.boolean :open_not_so_scary
      t.string :category_code
      t.decimal :duration
      t.string :scheduled_code
      t.string :what_it_is
      t.string :scope_and_scale_code
      t.string :when_to_go
      t.string :average_wait_per_hundred
      t.string :average_wait_assumes
      t.string :loading_speed
      t.string :probable_wait_time
      t.string :special_needs
      t.string :height_restriction
      t.boolean :intense
      t.datetime :extinct_on
      t.datetime :opened_on
      t.boolean :frightening
      t.boolean :physical_considerations
      t.boolean :handheld_captioning
      t.boolean :video_captioning
      t.boolean :reflective_captioning
      t.boolean :assistive_listening
      t.boolean :audio_description
      t.string :wheelchair_transfer_code
      t.boolean :no_service_animals
      t.boolean :sign_language
      t.boolean :service_animal_check
      t.boolean :not_to_be_missed
      t.boolean :rider_swap
      t.string :ultimate_code
      t.string :ultimate_task
      t.string :park_entrance
      t.string :relative_open
      t.string :relative_close
      t.boolean :close_at_dusk
      t.boolean :fastpass_available
      t.integer :crowd_calendar_version
      t.string :match_name
      t.integer :crazy_threshold
      t.boolean :fastpass_only
      t.boolean :allow_showtimes_after_close
      t.boolean :disconnected_fastpass_booth
      t.integer :crowd_calendar_group
      t.string :arrive_before
      t.string :arrive_before_fp
      t.boolean :opens_at_sunset
      t.boolean :closes_at_sunset

      t.timestamps
    end
  end
end

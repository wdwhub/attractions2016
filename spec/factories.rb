FactoryGirl.define do
  factory :event do
    name "MyString"
    frequency 1
    at "MyString"
    job_name "MyString"
    job_arguments ""
  end
  factory :cached_tip do
    foursquare_tip_id "MyString"
    text "MyText"
    kind "MyString"
    canonical_url "MyText"
    lang "MyString"
    likes_count "MyString"
    log_view "MyString"
    agree_count "MyString"
    foursquare_user_id 1
    foursquare_user_first_name "MyString"
    foursquare_last_name "MyString"
    foursquare_user_gender "MyString"
    foursquare_user_photo_prefix "MyString"
    foursquare_user_photo_suffix "MyString"
    foursquare_venue_id "MyString"
  end
  factory :cached_photo do
    height 144
    created_at_by_epoch 1432308844
    width 1
    foursquare_venue_id "MyString"
    prefix "https://irs2.4sqi.net/img/general/"
    suffix "/218532_d-sTFfsLRzL2HrxkB40qw0sL2GXaJRWK2cbXPMbOhHE.jpg"
    sequence(:suffix) { |n| "/218532_d-sTFfsLRzL2HrxkB40qw0sL2GXaJRWK2cbXPMbOhHE#{n}.jpg"}
    
    fousquare_user "MyString"
    visibility "MyString"
    foursquare_photo_id "MyString"
  end
  factory :cached_attraction do
    sequence(:name) { |n| "venue name#{n}"}
    sequence(:permalink) { |n| "venue-permalink#{n}"}
    fastpass_booth false
    short_name "MyString"
    open_emh_morning false
    open_emh_evening false
    single_rider false
    time_zone "MyString"
    seasonal false
    open_very_merry false
    open_not_so_scary false
    category_code "MyString"
    duration "9.99"
    scheduled_code "MyString"
    what_it_is "MyString"
    scope_and_scale_code "MyString"
    when_to_go "MyString"
    average_wait_per_hundred "MyString"
    average_wait_assumes "MyString"
    loading_speed "MyString"
    probable_wait_time "MyString"
    special_needs "MyString"
    height_restriction "MyString"
    intense false
    extinct_on "2016-08-14 09:01:15"
    opened_on "2016-08-14 09:01:15"
    frightening false
    physical_considerations false
    handheld_captioning false
    video_captioning false
    reflective_captioning false
    assistive_listening false
    audio_description false
    wheelchair_transfer_code "MyString"
    no_service_animals false
    sign_language false
    service_animal_check false
    not_to_be_missed false
    rider_swap false
    ultimate_code "MyString"
    ultimate_task "MyString"
    park_entrance "MyString"
    relative_open "MyString"
    relative_close "MyString"
    close_at_dusk "MyString"
    fastpass_available false
    crowd_calendar_version 1
    match_name "MyString"
    crazy_threshold 1
    fastpass_only false
    allow_showtimes_after_close false
    disconnected_fastpass_booth false
    crowd_calendar_group 1
    arrive_before "MyString"
    arrive_before_fp "MyString"
    opens_at_sunset false
    closes_at_sunset false
  end
  factory :foursquare_cached_venue do
    sequence(:name) { |n| "venue name#{n}"}
    foursquare_venue_id "578d25d0498e908e62c12501"
    sequence(:foursquare_venue_id) { |n| "578d25d0498e908e62c125#{n}"}
    address "MyString"
    cross_street "MyString"
    lat "MyString"
    lng "MyString"
    alt_venues "MyString"
    searched_for "MyString"
    categories "MyText"
    referral_id "MyString"
    location "MyText"
    canonical_url "MyText"
    verified false
    dislike false
    ok false
    rating "9.99"
    rating_signals "MyString"
    rating_color "MyString"
    allow_menu_url_edit false
    specials "MyString"
    wdw_uri "MyText"
  end
  factory :touringplans_cached_venue do
    name "MyString"
    fastpass_booth false
    short_name "MyString"
    open_emh_morning false
    open_emh_evening false
    single_rider false
    time_zone "MyString"
    seasonal false
    open_very_merry false
    open_not_so_scary false
    category_code "MyString"
    duration "9.99"
    scheduled_code "MyString"
    what_it_is "MyString"
    scope_and_scale_code "MyString"
    when_to_go "MyString"
    average_wait_per_hundred "MyString"
    average_wait_assumes "MyString"
    loading_speed "MyString"
    probable_wait_time "MyString"
    special_needs "MyString"
    height_restriction "MyString"
    intense false
    extinct_on "2016-08-13 10:58:13"
    opened_on "2016-08-13 10:58:13"
    frightening false
    physical_considerations false
    handheld_captioning false
    video_captioning false
    reflective_captioning false
    assistive_listening false
    audio_description false
    wheelchair_transfer_code "MyString"
    no_service_animals false
    sign_language false
    service_animal_check false
    not_to_be_missed false
    rider_swap false
    ultimate_code "MyString"
    ultimate_task "MyString"
    park_entrance "MyString"
    relative_open "MyString"
    relative_close "MyString"
    close_at_dusk false
    fastpass_available false
    crowd_calendar_version 1
    match_name "MyString"
    crazy_threshold 1
    fastpass_only false
    allow_showtimes_after_close false
    disconnected_fastpass_booth false
    crowd_calendar_group 1
    arrive_before "MyString"
    arrive_before_fp "MyString"
    opens_at_sunset false
    closes_at_sunset false
  end
end

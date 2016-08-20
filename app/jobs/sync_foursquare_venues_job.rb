class SyncFoursquareVenuesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    FoursquareSync.new.update_all_foursquare_cached_venues
  end
end

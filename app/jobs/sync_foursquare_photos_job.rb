class SyncFoursquarePhotosJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    FoursquareSync.new.update_photos_for_all_venues
  end
end

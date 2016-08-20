class SyncFoursquareTipsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    FoursquareSync.new.update_tips_for_all_venues
  end
end

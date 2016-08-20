class SyncWithTouringplansJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    TouringplansSync.new.update_all_cached_touringplans_venues
  end
end

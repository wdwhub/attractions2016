class SyncAttractionsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    AttractionSync.new.update_all_from_touringplans_com
  end
end

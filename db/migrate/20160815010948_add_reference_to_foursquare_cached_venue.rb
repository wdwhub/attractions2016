class AddReferenceToFoursquareCachedVenue < ActiveRecord::Migration[5.0]
  def change
    add_reference :foursquare_cached_venues, :cached_attraction, foreign_key: true
  end
end

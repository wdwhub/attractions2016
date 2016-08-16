class FoursquareCachedVenue < ApplicationRecord
  belongs_to :cached_attraction
  
  def find_cached_photos
    cached_photos = CachedPhoto.where("foursquare_venue_id = ?", foursquare_venue_id)
  end
  
end

class CachedPhoto < ApplicationRecord
  def title
    "i am cached_photo"
  end
  
  # def find_parent_foursquare_venue(venue_id: self.foursquare_venue_id)
  #   cached_foursquare_venue = FoursquareCachedVenue.where("foursquare_id = ?", venue_id).first
  # end
  
end

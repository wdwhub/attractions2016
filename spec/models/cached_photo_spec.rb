require 'rails_helper'

RSpec.describe CachedPhoto, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("i am cached_photo")
    end
  end

  describe '#find_parent_foursquare_venue(venue_id: self.foursquare_venue_id)' do
    before(:each) do
    end
    it 'works' do
      # foursquare_venue  = create(:foursquare_cached_venue)
      # foursquare_venue_id   = foursquare_venue.foursquare_venue_id
      cached_photo      = create(:cached_photo, foursquare_venue_id: "lorem2t4")
      expect(subject.find_parent_foursquare_venue(venue_id: cached_photo.foursquare_venue_id)).to eq("something")
    end
    
  end
end

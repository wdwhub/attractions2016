class FoursquareSync
  attr_reader :venue_default
  
  def initialize (venue_default: FoursquareMissingVenue.new)
    @venue_default  = venue_default
  end
  
  def title
    "foursquare sync for attractions"
  end
  
  def collect_all_cached_attraction_venue_names_and_ids
    collection = CachedAttraction.all.collect { |venue| 
      {cached_attraction_name: venue.name, cached_attraction_id:venue.id} 
    }
  end

  def collect_all_foursquare_venue_ids
    FoursquareCachedVenue.all.collect { |venue| venue.foursquare_venue_id }
  end

  def update_all_foursquare_cached_venues
    list = collect_all_cached_attraction_venue_names_and_ids
    list.each { |venue| create_or_update_cached_venue(cached_attraction_name: "#{venue[:cached_attraction_name]}", cached_attraction_id: venue[:cached_attraction_id])}

    # list.each { |venue| create_or_update_cached_venue(cached_attraction_name: venue[:venue_name], cached_attraction_id: venue[:venue_id] ) }
  end
  
  def create_or_update_cached_venue(cached_attraction_name: , cached_attraction_id:)
    # puts     "cached_attraction_name: #{cached_attraction_name}, cached_attraction_id: #{cached_attraction_id}"
    
    remote_venue    = find_remote_venue(cached_attraction_name)
    return venue_default if remote_venue.id.to_s.length <= 3

    puts remote_venue
    cached_venue  = FoursquareCachedVenue.where(
      foursquare_venue_id: remote_venue.id)
      .first_or_create
    cached_venue.update(name:   remote_venue.name                   || venue_default.name,
       address:               remote_venue.location.first.address   || venue_default.address,
       lat:                   remote_venue.location.first.lat       || venue_default.lat,
       lng:                   remote_venue.location.first.lng       || venue_default.lng,
       wdw_uri:               remote_venue.url                      || venue_default.wdw_uri,
       canonical_url:         remote_venue.canonicalUrl             || venue_default.canonical_url,
       verified:              remote_venue.verified                 || venue_default.verified,
       dislike:              remote_venue.dislike                 || venue_default.dislike,
       ok:              remote_venue.ok                 || venue_default.ok,
       rating:                remote_venue.rating                   || venue_default.rating,
       rating_color:              remote_venue.rating_color         || venue_default.rating_color,
       rating_signals:              remote_venue.rating_signals     || venue_default.rating_signals,
       specials:              remote_venue.specials.first.to_s      || venue_default.specials,
       foursquare_venue_id:         remote_venue.id.to_s            || venue_default.foursquare_id,
       cached_attraction_id:              cached_attraction_id      || venue_default.venue_id

     )
     puts "==== sync #{remote_venue.id  } ==="

     puts "======================="

  end
  
  def create_or_update_cached_photos(venue_id:)
    fsq_photos = FoursquarePhoto.new.venue_photos(venue_id)
    fsq_photos.photos.each do |image|
      # puts "venue_id: #{venue_id}, cached_photo: #{image.id}"
      cached_photo             = CachedPhoto.where(foursquare_photo_id: image.id).first_or_create
      
      cached_photo.update(height:      image.height         || venue_default.height,
      created_at_by_epoch:      image.createdAt             || venue_default.created_at_by_epoch,
      width:                    image.width                 || venue_default.width,
      foursquare_venue_id:      venue_id                    || venue_default.venue_id,
      prefix:                   image.prefix                || venue_default.prefix,
      suffix:                   image.suffix                || venue_default.suffix,
      fousquare_user:           image.fousquare_user.to_s   || venue_default.fousquare_user,
      visibility:               image.visibility            || venue_default.visibility
      )
    end
    
  end
  
  def create_or_update_cached_tips(venue_id:)
    fsq_tips = FoursquareTip.new.venue_tips(venue_id)
    fsq_tips.tips.each do |tip|
      tip
      # puts "===="
      cached_tip             = CachedTip.where(foursquare_tip_id: tip.id).first_or_create
      
      cached_tip.update(foursquare_tip_id:  tip.id                || :venue_default.foursquare_tip_id,
      text:                           tip.text                    || :venue_default.text,
      kind:                           tip.type                    || :venue_default.type,
      foursquare_venue_id:            venue_id                    || :venue_default.venue_id,
      canonical_url:                  tip.canonical_url           || :venue_default.canonical_url,
      foursquare_user_photo_prefix:   tip.user.first.photo_prefix || :venue_default.user_photo_prefix,
      foursquare_user_photo_suffix:   tip.user.first.photo_suffix || :venue_default.user_photo_suffix,
      foursquare_user_id:             tip.user.first.id           || :venue_default.foursquare_user_id,
      foursquare_user_first_name:     tip.user.first.first_name   || :venue_default.foursquare_user_first_name,
      foursquare_last_name:           tip.user.first.last_name    || :venue_default.foursquare_user_last_name
      )
      # t.string   "likes_count"
      # t.string   "log_view"
      # t.string   "agree_count"
      # t.string   "foursquare_last_name"
      # t.string   "foursquare_user_gender"
      
    end
    
  end
  
  def foursquare_venue_representation(venue_id)
    FoursquareVenue.new.venue(venue_id)
  end

  def find_remote_venue(venue_name)
    remote_venue_summary = [FoursquareVenue.new.search(:query => venue_name).venues.first]
    
    found_remote_venue = (remote_venue_summary.map { |rvs| rvs || venue_default }).first
    # animals = remote_venue_summary.map {|rvm| |id| Animal.find(id) || MissingAnimal.new }
    if found_remote_venue.id != venue_default.id
      found_remote_venue    = foursquare_venue_representation(found_remote_venue["id"])
    end
    result = found_remote_venue
  end
  
  def update_photos_for_all_venues
    list = collect_all_foursquare_venue_ids
    list.each { |venue_id| create_or_update_cached_photos(venue_id: venue_id.to_s)}
  end
  
  def update_tips_for_all_venues
    list = collect_all_foursquare_venue_ids
    list.each { |venue_id| create_or_update_cached_tips(venue_id: venue_id.to_s)}
  end
  
end

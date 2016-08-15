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

  def update_all_foursquare_cached_venues
    list = collect_all_cached_attraction_venue_names_and_ids
    list.each { |venue| create_or_update_cached_venue(cached_attraction_name: "#{venue[:cached_attraction_name]}", cached_attraction_id: venue[:cached_attraction_id])}

    # list.each { |venue| create_or_update_cached_venue(cached_attraction_name: venue[:venue_name], cached_attraction_id: venue[:venue_id] ) }
  end
  
  def create_or_update_cached_venue(cached_attraction_name: , cached_attraction_id:)
    puts     "cached_attraction_name: #{cached_attraction_name}, cached_attraction_id: #{cached_attraction_id}"
    
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
    # #  # puts "Eatery #{cached_venue.name}, address #{cached_venue.address}, lat #{cached_venue.lat}, lng #{cached_venue.lng}, wdw_uri #{cached_venue.wdw_uri}, verified #{cached_venue.verified}, dislike #{cached_venue.dislike}, ok #{cached_venue.ok}, rating #{cached_venue.rating}, rating_signals #{cached_venue.rating_signals}, specials #{cached_venue.specials}, wdw_uri #{cached_venue.wdw_uri}"
    #  puts "sync +++++++++++++"
    #  puts "remote_venue #{remote_venue.name}, address #{remote_venue.location.first.address}, lat #{remote_venue.location.first.lat}, lat #{remote_venue.location.first.lat}, lng #{remote_venue.location.first.lng}, wdw_uri #{remote_venue.wdw_uri}, verified #{remote_venue.verified}, dislike #{remote_venue.dislike}, ok #{remote_venue.ok}, rating #{remote_venue.rating}, rating_signals #{remote_venue.rating_signals}, specials #{remote_venue.specials}, wdw_uri #{remote_venue.url}"
    #  puts "++++++++++++++"
    # #  puts "remote_venue #{remote_venue}"
    #  puts "======================="
    # #
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
  
end

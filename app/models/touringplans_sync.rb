require_relative "./representations/attraction"

class TouringplansSync
  
  attr_accessor :client, :routes, :venue_default

  def initialize(client: TouringplansClient.new, routes: TouringplansClient.new.routes)
    @client         = client
    @routes         = routes
    @venue_default  = TouringplansMissingVenue.new
  end

  def title
    "I am touring plans park sync"
  end
  
  def update_all_cached_touringplans_venues
    client.routes.keys.each { |route| update_park_venues(park_route_key: route) }
  end
  def update_park_venues(park_route_key:)
    list = list_park_venues(route: park_route_key)
    # list.collect { |venue| venue.name }
    list.each do |venue_representation|
      updated_venue = update_cached_touring_plans_venue_from_touringplans_com(
        route: park_route_key, 
        representation:  venue_representation)
      puts updated_venue
    end
  end
  
  def list_park_venues(route:)
    client.permalink          = ""
    response                  = client.send(route)
    result                    = Representation.new(
        {"attractions" => response}
      )
      .attractions
  end
  
  def collect_touringplans_venue_representation(route:, permalink:)
    client.permalink          = permalink
    response                  = client.send(route)
    result                    = Representation.new(
        {"attractions" => [response]}
      )
  end
  
  def update_cached_touring_plans_venue_from_touringplans_com(route:, representation: )
    return venue_default if representation.permalink.to_s.length == 0
    
    remote_touringplans_venue = self.collect_touringplans_venue_representation(
        route: route, 
        permalink: representation.permalink
      )
      .attractions
      .first
      
    remote_touringplans_venue.permalink = representation.permalink # remote tp doesn't have a permalink
    tp_cached_venue  = TouringplansCachedVenue.where(
      permalink: remote_touringplans_venue.permalink
      ).first_or_create
    
    tp_cached_venue.update(remote_touringplans_venue.to_h)
    puts "==== #{tp_cached_venue.permalink} ==="
    # puts tp_cached_venue.attributes
    puts "======================="
    
    
  end
end
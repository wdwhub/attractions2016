class AttractionSync
  attr_reader :permalinks
  def initialize( permalinks: TouringplansCachedVenue.all.collect {|venue| venue.permalink})
    @permalinks = permalinks
  end
  
  
  def title
    "attraction sync"
  end


  def update_all_from_touringplans_com
    permalinks.each do |permalink|
      update_from_touringplans_com(permalink: permalink)
    end
  end

  def update_from_touringplans_com(permalink:)
    tvc = TouringplansCachedVenue.find_by(permalink: permalink)
    return if tvc.permalink.to_s.length == 0
    
    cached_attraction  = CachedAttraction.where(
      permalink: tvc.permalink
      ).first_or_create
    
      cached_attraction.update(tvc.attributes)
      
      puts "==== #{cached_attraction.permalink} ==="
      puts cached_attraction.attributes
      puts "======================="
    
  end
end

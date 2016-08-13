require_relative "representations/attraction"

class TouringplansSync
  
  attr_accessor :client

  def initialize(client: TouringplansClient.new)
    @client = client
  end

  def title
    "I am touring plans park sync"
  end
  
  def list_park_venues(route:)
    client.permalink        = ""
    response                  = client.send(route)
    result                    = Representation.new(
        {"attractions" => response}
      )
  end
  
end
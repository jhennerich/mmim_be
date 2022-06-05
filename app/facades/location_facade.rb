class LocationFacade
  def self.service
    GoogleMapApiService.new
  end

  def self.get_near_by_locations(midpoint_attributes)
#    midpoint_coords = "39.7423858%2C-105.0372717"
    results = service.nearbysearch(midpoint_attributes)
    #create_location(results)
  end

  def self.create_location(results)
    results[:results].map do |result|
      Location.new(
        id: meeting_id[:id].to_i,
        place_id: result[:place_id],
        name: result[:name],
#        address:
        rating: result[:rating],
        price_range: result[:price_level]
      )
    end
  end

  def self.create_midpoint
    #TODO logic to create midpoint locaion between 2 given locations
  end
end

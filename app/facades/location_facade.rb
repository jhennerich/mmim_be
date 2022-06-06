class LocationFacade
  def self.service
    GoogleMapApiService.new
  end

  def self.get_near_by_locations(mid_coord, category)
    location_results = service.nearbysearch("location=#{mid_coord}&type=#{category}&rankby=distance")
    location_results[:results].map do |location_result|
      LocationResponse.new(location_result)
    end
  end
end

class MidpointFacade
  def self.service
    GoogleMapApiService.new
  end

  def self.address_to_geocode(address)
    results = service.address_to_geocode(address)
    #binding.pry
    #coords = [:results].first[:geometry][:location]
  end

  def self.create_midpoint
    #TODO logic to create midpoint locaion between 2 given locations
  end
end

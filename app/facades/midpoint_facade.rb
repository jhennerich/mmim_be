class MidpointFacade
  def self.service
    GoogleMapApiService.new
  end

  def self.address_to_geocode(address)
    data = service.address_to_geocode(address)
    {lat: data[:results][0].dig(:geometry,:location, :lat),
     lng: data[:results][0].dig(:geometry,:location, :lng)}
  end

  def self.find_midpoint(add_1, add_2)
    coord_1 = address_to_geocode(add_1)
    coord_2 = address_to_geocode(add_2)
    midpoint_coords = "#{(coord_1[:lat] + coord_2[:lat])/2}%2C#{(coord_1[:lng] + coord_2[:lng])/2}"
  end
end

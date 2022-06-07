require 'rails_helper'

describe 'Location Facade' do
  xit 'returns locations given a midpoint' do
    mid_coord = "39.7512038%2C-104.9447319"
    attributes = "location=#{mid_coord}&type=cafe&rankby=distance"
    json_response = File.read('spec/fixtures/nearbysearch.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/place/nearbysearch/json?#{attributes}&key=#{ENV['google_api_key']}")
    .to_return(status: 200, body: json_response, headers: {})

    location_results = LocationFacade.get_near_by_locations(mid_coord, "cafe")
    binding.pry
    expect(location_results).to be_a(String)

#    geocode = MidpointFacade.address_to_geocode(address)
#    expect(geocode).to be_a(Hash)
#    expect(geocode).to have_key(:lat)
#    expect(geocode[:lat]).to be_a(Float)
#    expect(geocode).to have_key(:lng)
#    expect(geocode[:lng]).to be_a(Float)
  end
end

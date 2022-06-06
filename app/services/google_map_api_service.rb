class GoogleMapApiService
  def conn
    Faraday.new(url: 'https://maps.googleapis.com/maps/api') do |faraday|
    faraday.params['key'] = ENV['google_api_key']
    end
  end

  def parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def address_to_geocode(address)
    response = conn.get("geocode/json?address=#{address}")
    parse_json(response)
  end

  def nearbysearch(attributes)
    response = conn.get("place/nearbysearch/json?#{attributes}")
    parse_json(response)
  end
end

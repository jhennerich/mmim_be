class Api::V1::MidpointController < ApplicationController
  def index
    address1 = params[:address1]
    address2 = params[:address2]
    category = params[:category]

    point1_coords = MidpointFacade.address_to_geocode(address1)[:results].first[:geometry][:location]
    point2_coords = MidpointFacade.address_to_geocode(address2)[:results].first[:geometry][:location]

    midpoint_lat = (point1_coords[:lat] + point2_coords[:lat]) /2
    midpoint_lng = (point1_coords[:lng] + point2_coords[:lng]) /2
    binding.pry

  #  render json: coords

#    build_nearby_search_attributes(coords)
#    render json: MidpointSerializer.new(coords)
  end

  def build_nearby_search_attributes(coords)
    lat = coords[:lat]
    lng = coords[:lng]
    location="#{lat}%2C#{lng}"
#    &radius=1500&type=restaurant
  end
end

class Api::V1::SearchController < ApplicationController
  def index
#    address1 = midpoint_params[:address1]
#    address2 = midpoint_params[:address2]
#    category = midpoint_params[:category]

    address_1 = search_params[:address_1]
    address_2 = search_params[:address_2]
    category = search_params[:category]

    point1_coords = MidpointFacade.address_to_geocode(address_1)[:results].first[:geometry][:location]
    point2_coords = MidpointFacade.address_to_geocode(address_2)[:results].first[:geometry][:location]

    midpoint_lat = (point1_coords[:lat] + point2_coords[:lat]) /2
    midpoint_lng = (point1_coords[:lng] + point2_coords[:lng]) /2

    midpoint_coords = "#{midpoint_lat}%2C#{midpoint_lng}"
    midpoint_attributes = "location=#{midpoint_coords}&radius=1500&type=#{search_params[:category]}"

    locations = LocationFacade.get_near_by_locations(midpoint_attributes)
    render json: locations
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

  private
  def search_params
    JSON.parse(params[:params], symbolize_names: true)
  end


end

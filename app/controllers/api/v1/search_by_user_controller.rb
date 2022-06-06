class Api::V1::SearchByUserController < ApplicationController
  def index
    address_1 = search_params[:address_1]
    address_2 = User.find_by(email: search_params[:user_b_email]).address
    category = search_params[:category]

    point1_coords = MidpointFacade.address_to_geocode(address_1)[:results].first[:geometry][:location]
    point2_coords = MidpointFacade.address_to_geocode(address_2)[:results].first[:geometry][:location]

    midpoint_lat = (point1_coords[:lat] + point2_coords[:lat]) /2
    midpoint_lng = (point1_coords[:lng] + point2_coords[:lng]) /2

    midpoint_coords = "#{midpoint_lat}%2C#{midpoint_lng}"
    midpoint_attributes = "location=#{midpoint_coords}&radius=1500&type=#{search_params[:category]}"

    locations = LocationFacade.get_near_by_locations(midpoint_attributes)[0..4]
    render json: LocationSerializer.new(locations)
  end

  private
  def search_params
    JSON.parse(params[:params], symbolize_names: true)
  end
end

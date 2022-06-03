class Api::V1::MidpointController < ApplicationController
  def index
    address = params[:address]
    coords = MidpointFacade.address_to_geocode(address)
    render json: coords
#    render json: MidpointSerializer.new(coords)
  end
end

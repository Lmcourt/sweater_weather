class Api::V1::RoadTripController < ApplicationController
  before_action :validate_api_key
  def create
    trip = RoadTripFacade.road_trip(road_trip_params[:origin], road_trip_params[:destination])
    render json: RoadTripSerializer.new(trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def validate_api_key
    user = User.find_by(api_key: params[:api_key])
    invalid_api_key if user.nil?
  end

  def invalid_api_key
    render json: { error: 'Invalid API key' }, status: 400
  end
end

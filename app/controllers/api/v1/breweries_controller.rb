class Api::V1::BreweriesController < ApplicationController
  def index
    brew = BreweriesFacade.breweries_by_location(params[:location], params[:quantity])
    render json: BreweriesSerializer.new(brew)
  end
end

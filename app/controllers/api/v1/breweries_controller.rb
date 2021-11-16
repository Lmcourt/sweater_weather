class Api::V1::BreweriesController < ApplicationController
  def index
    brew = BreweriesFacade.breweries_by_location(params[:location], params[:quantity])

    if params[:quantity].to_i < 1
      render json: { error: 'Invalid quantity' }, status: 400
    else
      render json: BreweriesSerializer.new(brew)
    end
  end
end

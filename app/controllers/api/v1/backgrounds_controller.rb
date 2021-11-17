class Api::V1::BackgroundsController < ApplicationController
  def index
    background = BackgroundFacade.photo_by_location(params[:location])
    render json: ImageSerializer.new(background)
  end
end

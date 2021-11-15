class Api::V1::ActivitiesController < ApplicationController
  def index
    activity = ActivityFacade.activity_by_type(params[:destination])
    render json: ActivitySerializer.new(activity)
  end
end

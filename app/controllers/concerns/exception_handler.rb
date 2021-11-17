module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message, errors: 'Invalid credentials' }, status: 400
    end

    # rescue_from ActionController::BadRequest do |e|
    #   render json: { errors: 'Invalid parameters' }, status: 400
    # end
  end
end

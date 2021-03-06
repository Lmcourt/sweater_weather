module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message, errors: 'email already exists or passwords do not match' }, status: 400
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message, errors: 'Invalid credentials' }, status: :not_found
    end
  end
end

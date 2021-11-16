require 'securerandom'

class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
    api_key = SecureRandom.uuid
    render json: UserSerializer.new(user, api_key), status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

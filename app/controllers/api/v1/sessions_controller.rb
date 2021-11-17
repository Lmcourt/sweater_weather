class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user.authenticate(params[:password])
    session[:user_id] = user.id
    render json: UsersSerializer.new(user)
    # else
    #   raise ActiveRecord::RecordNotFound
    # end
  end
end

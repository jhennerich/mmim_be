class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_or_create_by(user_params)
      if user
        render json: UserSerializer.new(user), status: 201
      else
        render json: { :message => 'User not created'}, status: 400
      end
  end

  def update
    user = User.find_by(email: user_params[:email])
    user.update(user_params)
    render json: UserSerializer.new(user), status: 201

  end

  private

  def user_params
    JSON.parse(params[:params], symbolize_names: true)
  end
end

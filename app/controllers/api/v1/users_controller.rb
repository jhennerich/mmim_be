class Api::V1::UsersController < ApplicationController

  def create
    render json: UserSerializer.new(User.create(user_params)), status: 201
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end

class Api::V1::UserMeetingsController < ApplicationController

  def index
    user = User.find_by(email: user_params[:email])
    render json: MeetingSerializer.new(user.meetings)
  end

  private
  def user_params
    JSON.parse(params[:params], symbolize_names: true)
  end
end

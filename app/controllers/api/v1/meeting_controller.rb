class Api::V1::MeetingController < ApplicationController

  def create
    host = User.find_by(email: meeting_params[:host_email])
    guest = User.find_by(email: meeting_params[:guest_email])
    meeting = Meeting.create(location_name: meeting_params[:location_name],
              location_address: meeting_params[:location_address],
              host_name: host.name,
              guest_name: guest.name )

    host_user_meeting = UserMeeting.create(meeting_id: meeting.id, user_id: host.id, host: true )
    guest_user_meeting = UserMeeting.create(meeting_id: meeting.id, user_id: guest.id, host: false )
    render json: { :status => 'ok' }, status: 201
  end

  def destroy
    meeting = Meeting.find(meeting_params[:meeting_id])
    if meeting
      meeting.destroy
    render json: { :status => 'deleted' }, status: 201
    end
  end

  private

  def meeting_params
    JSON.parse(params[:params], symbolize_names: true)
  end
end

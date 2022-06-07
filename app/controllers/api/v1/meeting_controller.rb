class Api::V1::MeetingController < ApplicationController

  def create
    host = User.find_by(email: meeting_params[:host_email])
    guest = User.find_by(email: meeting_params[:guest_email])
    meeting = Meeting.create(status: 0)
    meeting_params[:place_ids].each do |place_id|
      Location.create(meeting_id: meeting.id, place_id: place_id)
    end
    host_user_meeting = UserMeeting.create(meeting_id: meeting.id, user_id: host.id, host: true )
    guest_user_meeting = UserMeeting.create(meeting_id: meeting.id, user_id: guest.id, host: false )
    render json: { :status => 'ok' }, status: 201
  end

  def destroy
    meeting = Meeting.find(meeting_params[:meeting_id])
    if meeting
      meeting.destroy
    end
  end

  private

  def meeting_params
    JSON.parse(params[:params], symbolize_names: true)
  end
end

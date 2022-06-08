require 'rails_helper'

RSpec.describe 'Meeting API endpoint' do
  it 'can create a meeting' do
    host = User.create!(name: 'john', email: 'john@email.com')
    guest = User.create!(name: 'max', email: 'max@email.com')

    meeting_params = {
      :host_email=>"john@email.com",
      :guest_email=>"max@email.com",
      :location_name=>"John's House",
      :location_address =>"1583 Newton St Denver CO"
    }.to_json

    post "/api/v1/meeting", params: {params: meeting_params}
    created_meeting = Meeting.last
    expect(response).to be_successful
    expect(created_meeting.status).to eq('pending')
  end
  it 'can delete a meeting' do
    meeting = Meeting.create(status: 0)
    deleted_meeting = Meeting.create(status: 0)
    meeting_params = { :meeting_id =>"#{deleted_meeting.id}"}.to_json
    meetings = Meeting.all
    delete "/api/v1/meeting", params: {params: meeting_params}

    expect(response).to be_successful
    expect(meetings.count).to eq(1)
    expect{Meeting.find(deleted_meeting.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end

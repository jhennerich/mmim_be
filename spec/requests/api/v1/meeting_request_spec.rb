require 'rails_helper'

RSpec.describe 'Meeting API endpoint' do
  it 'can create a meeting' do
    host = User.find_or_create_by!(name: 'john', email: 'john@email.com')
    guest = User.find_or_create_by!(name: 'max', email: 'max@email.com')

    meeting_params = {
      :host_email=>"john@email.com",
      :guest_email=>"max@email.com",
      :location_name=>"John's House",
      :location_address =>"1583 Newton St Denver CO"
    }.to_json

    post "/api/v1/meeting", params: {params: meeting_params}
    created_meeting = Meeting.last
    expect(response).to be_successful
    expect(created_meeting.host_name).to eq('john')
    expect(created_meeting.guest_name).to eq('max')
    expect(created_meeting.location_name).to eq("John's House")
    expect(created_meeting.location_address).to eq('1583 Newton St Denver CO')


  end
  it 'can delete a meeting' do
    a_meeting = Meeting.create!(location_name: "Somewhere",
          location_address: "123 Anywhere St",
          host_name: "john",
          guest_name: "max" )

    deleted_meeting = Meeting.create(location_name: "John's House",
          location_address: "1583 Newton St. Denver CO",
          host_name: "john",
          guest_name: "max" )

    meeting_params = { :meeting_id =>"#{deleted_meeting.id}"}.to_json
    meetings = Meeting.all
    num_of_meetings = meetings.count
    delete "/api/v1/meeting", params: {params: meeting_params}

    expect(response).to be_successful
    expect(num_of_meetings - 1).to eq(meetings.count)
    expect{Meeting.find(deleted_meeting.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end

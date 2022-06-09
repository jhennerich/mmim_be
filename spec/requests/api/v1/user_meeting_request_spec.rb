require 'rails_helper'

RSpec.describe 'user_meeting API endpoint' do
  it 'returns all meeting data for a give user email' do
    host = User.find_or_create_by!(name: 'john', email: 'john@email.com')
    guest = User.find_or_create_by!(name: 'max', email: 'max@email.com')
    meeting = Meeting.create!(
      :host_name=>"john",
      :guest_name=>"max",
      :location_name=>"John's House",
      :location_address =>"1583 Newton St Denver CO"
    )

    meeting_1 = Meeting.create!(location_name: "A great place", location_address: "123 test way",
    host_name: "john", guest_name: "max")
    meeting_2 = Meeting.create!(location_name: "A bad place", location_address: "234 test blvd",
    host_name: "john", guest_name: "max")

    user_meeting_1 = UserMeeting.create(user_id: host.id, meeting_id: meeting.id)
    user_meeting_2 = UserMeeting.create(user_id: host.id, meeting_id: meeting_1.id)

    params = { email: 'john@email.com' }.to_json
    get "/api/v1/user_meetings", params: { params: params }

    expect(response).to be_successful

    john_meetings = JSON.parse(response.body, symbolize_names: true)[:data]
    john_meetings.each do |meet|
      expect(meet).to have_key(:id)
      expect(meet[:id]).to be_a(String)
      expect(meet).to have_key(:type)
      expect(meet[:type]).to eq('meeting')

      expect(meet).to have_key(:attributes)
      expect(meet[:attributes].count).to eq(4)

      expect(meet[:attributes]).to have_key(:host_name)
      expect(meet[:attributes][:host_name]).to be_a(String)

      expect(meet[:attributes]).to have_key(:guest_name)
      expect(meet[:attributes][:guest_name]).to be_a(String)
      expect(meet[:attributes]).to have_key(:location_name)
      expect(meet[:attributes][:location_name]).to be_a(String)

      expect(meet[:attributes]).to have_key(:location_address)
      expect(meet[:attributes][:location_address]).to be_a(String)
    end
  end
end

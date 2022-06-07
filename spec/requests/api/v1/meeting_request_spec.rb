require 'rails_helper'

RSpec.describe 'Meeting API endpoint' do
  it 'can create a meeting' do
    host = User.create!(name: 'john', email: 'john@email.com')
    guest = User.create!(name: 'max', email: 'max@email.com')

    meeting_params = {
      :host_email=>"john@email.com",
      :guest_email=>"max@email.com",
      :place_ids=>["ChIJk4m1HlJ-bIcRJhx_J2Wu6yI", "ChIJs475Y36AbIcRv5MAFA7M5zM", "ChIJxUOrn8p_bIcRn-Nczgjz188"]
    }.to_json

    post "/api/v1/meeting", params: {params: meeting_params}
    created_meeting = Meeting.last
    expect(response).to be_successful
    expect(created_meeting.status).to eq('pending')

  end
end

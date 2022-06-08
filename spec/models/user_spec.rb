require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  describe "relationships" do
    it { should have_many :user_meetings}
    it { should have_many :meetings}
  end

  describe "class methods" do
    it "#find_all_meetings" do
      host = User.create!(name: 'john', email: 'john@email.com')
      guest = User.create!(name: 'max', email: 'max@email.com')
      meeting_1 = Meeting.create!(place_id: "somewhere", status: 0)
      meeting_2 = Meeting.create!(place_id: "somewhere", status: 0)
      meeting_3 = Meeting.create!(place_id: "somewhere else", status: 0)

      user_meeting = UserMeeting.create!(user_id: host.id, meeting_id: meeting_1.id, host: true)
      user_meeting3 = UserMeeting.create!(user_id: host.id, meeting_id: meeting_2.id, host: true)
      user_meeting2 = UserMeeting.create!(user_id: guest.id, meeting_id: meeting_1.id, host: false)
      meeting_ids = User.find_all_meetings(host.id).first.meeting_ids
     end
  end
end

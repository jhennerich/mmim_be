require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location_name}
    it { should validate_presence_of :location_address }
    it { should validate_presence_of :host_name }
    it { should validate_presence_of :guest_name }
  end

  describe "relationships" do
    it { should have_many :user_meetings}
   end
end

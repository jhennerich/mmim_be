require 'rails_helper'

RSpec.describe Meeting, type: :model do
  describe 'validations' do
    it { should validate_presence_of :status}
#    it { should validate_presence_of :place_id }
  end

  describe "relationships" do
    it { should have_many :user_meetings}
   end
end

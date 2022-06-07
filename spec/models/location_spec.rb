require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    it { should validate_presence_of :meeting_id }
    it { should validate_presence_of :place_id }
#    it { should validate_presence_of :name }
#    it { should validate_presence_of :address }
#    it { should validate_presence_of :rating }
#    it { should validate_presence_of :img_url }
#    it { should validate_presence_of :price_range }
  end

  describe "relationships" do
    it { should belong_to :meeting}
   end
end

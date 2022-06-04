require 'rails_helper'

RSpec.describe 'The midpoint API' do
#  before
#  VCR.insert_cassette('translates_a_street')
#end
  it 'translates a street address to a geocode', :vcr do

#    VCR.use_cassette('propublica_members_of_the_senate', re_record_interval: 2.days) do

    json_response = File.open("./spec/fixtures/address_to_geocode.json")

    visit '/api/v1/midpoint?address1=1583%20Newton%20St%20Denver%20CO&address2=2300%20Steele%20St%20Denver%20CO'
#    save_and_open_page

  end
end

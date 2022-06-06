require 'rails_helper'

RSpec.describe 'The search API' do
#  before
#  VCR.insert_cassette('translates_a_street')
#end
  it 'Given steet address return 5 midpoint locations', :vcr do

    params = {
      address_1: '1583 Newton St Denver CO',
      address_2: '2300 Steele St Denver CO',
      category: 'cafe'
    }.to_json
    get "/api/v1/search", params: { params: params }

    binding.pry
  end
end

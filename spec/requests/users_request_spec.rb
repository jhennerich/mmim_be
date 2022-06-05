require 'rails_helper'

describe "Users API" do
  it "creates a user" do
    params = {name: 'test user', email: 'test@email.com'}.to_json

    post "/api/v1/users", params: {params: params}

    created_user = User.last 

    expect(response.status).to eq(201)
    expect(created_user.name).to eq('test user')
    expect(created_user.email).to eq('test@email.com')
    expect(created_user.address).to eq(nil)
  end

  it "updates a user address" do
    params = {name: 'test user', email: 'test@email.com'}.to_json
    post "/api/v1/users", params: {params: params}

    address_params = {email: 'test@email.com', address: '123 st, city, state, 80123'}.to_json
    
    put "/api/v1/users", params: {params: address_params}

    updated_user = User.last 

    expect(response.status).to eq(200)
    expect(updated_user.name).to eq('test user')
    expect(updated_user.email).to eq('test@email.com')
    expect(updated_user.address).to eq('123 st, city, state, 80123')
  end
end
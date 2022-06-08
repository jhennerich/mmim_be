require 'rails_helper'

describe "Users API" do
  let!(:user2) {User.create!(name: 'user2', email: 'user2.email.com')}

  it "creates a user" do
    params = {name: 'test user', email: 'test@email.com'}.to_json

    post "/api/v1/users", params: {params: params}

    created_user = User.last 

    expect(response.status).to eq(201)
    expect(created_user.name).to eq('test user')
    expect(created_user.email).to eq('test@email.com')
    expect(created_user.address).to eq(nil)
  end

  it 'finds a user via email' do 
    params = {email: 'user2.email.com'}.to_json

    get "/api/v1/find_user", params: {params: params}

    expect(response.status).to eq(200)

    user_found = User.find_by(email: 'user2.email.com')
    expect(user_found).to eq(user2)
  end

  it "updates a user address" do
    params = {name: 'test user', email: 'test@email.com'}.to_json
    post "/api/v1/users", params: {params: params}
    user = User.last 
    expect(user.address).to eq(nil)

    address_params = {email: 'test@email.com', address: '123 st, city, state, 80123'}.to_json
    
    put "/api/v1/users", params: {params: address_params}

    updated_user = User.find_by(email: 'test@email.com')

    expect(response.status).to eq(200)
    expect(updated_user.name).to eq('test user')
    expect(updated_user.email).to eq('test@email.com')
    expect(updated_user.address).to eq('123 st, city, state, 80123')
  end


end
require 'rails_helper'

describe 'user sessions' do
  let(:user) { create(:user) }
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  it 'creates a session' do
    user_params = {
      email: user.email,
      password: user.password
    }

    post '/api/v1/sessions', params: user_params.to_json, headers: headers

    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)

    expect(user[:data]).to be_a(Hash)
    expect(user[:data][:type]).to eq('users')
    expect(user[:data][:attributes]).to be_a(Hash)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'sends 400 error if given wrong password' do
    user_params = {
      email: user.email,
      password: 'notthepassword'
    }
    post '/api/v1/sessions', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(404)
  end

  it 'sends 400 if no email is given' do
    user_params = {
      password: user.password
    }
    post '/api/v1/sessions', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(404)
  end

  it 'sends 400 if no password' do
    user_params = {
      email: user.email,
    }
    post '/api/v1/sessions', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(404)

  end
end

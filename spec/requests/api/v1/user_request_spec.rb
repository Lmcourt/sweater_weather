require 'rails_helper'

describe 'user creation' do
  let(:user) { create(:user) }
  let(:headers) { { 'CONTENT_TYPE' => 'application/json' } }

  it 'creates a user' do
    user_params = {
      email: 'my_email@gmail.com',
      password: 'notapassword',
      password_confirmation: 'notapassword'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers

    expect(response).to be_successful

    new_user = JSON.parse(response.body, symbolize_names: true)

    expect(new_user[:data]).to be_a(Hash)
    expect(new_user[:data][:type]).to eq('users')
    expect(new_user[:data][:attributes]).to be_a(Hash)
    expect(new_user[:data][:attributes]).to have_key(:email)
    expect(new_user[:data][:attributes]).to have_key(:api_key)
    expect(new_user[:data][:attributes][:email]).to be_a(String)
    expect(new_user[:data][:attributes][:api_key]).to be_a(String)
    expect(new_user[:data][:attributes]).to_not have_key(:password)
    expect(new_user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'sends 400 error if email is taken' do
    user_params = {
      email: user.email,
      password: user.password,
      password_confirmation: user.password_confirmation
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(400)
  end

  it 'sends 400 error if password doesnt match' do
    user_params = {
      email: 'user@email.com',
      password: 'motdepass',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(400)
  end

  it 'sends 400 error if email is not present' do
    user_params = {
      password: 'motdepass',
      password_confirmation: 'password'
    }

    post '/api/v1/users', params: user_params.to_json, headers: headers
    expect(response).to have_http_status(400)
  end
end

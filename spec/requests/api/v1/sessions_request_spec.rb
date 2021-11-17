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
  end
end

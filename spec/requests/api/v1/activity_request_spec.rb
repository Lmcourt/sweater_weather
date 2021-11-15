require 'rails_helper'

describe 'activity API' do
  it 'gets two activities for all temperatures' do
    get '/api/v1/activities?destination=chicago,il'
    expect(response).to be_successful
  end
end

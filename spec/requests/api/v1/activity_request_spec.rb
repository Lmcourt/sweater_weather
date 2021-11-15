require 'rails_helper'

describe 'activity API' do
  it 'gets two activities for all temperatures' do
    get '/api/v1/activities?destination=chicago,il'
    expect(response).to be_successful

    activities = JSON.parse(response.body, symbolize_names:true)

    expect(activities[:data]).to be_a(Hash)
    expect(activities[:data][:id]).to eq(nil)
    expect(activities[:data][:type]).to eq('activities')
    expect(activities[:data][:attributes]).to be_a(Hash)
    expect(activitie[:data][:attributes][:destination]).to be_a(String)
    expect(activitie[:data][:attributes][:forecast]).to be_a(Hash)
    expect(activitie[:data][:attributes][:activities]).to be_an(Array)

  end
end

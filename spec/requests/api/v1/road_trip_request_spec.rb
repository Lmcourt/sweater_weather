require 'rails_helper'

RSpec.describe "Roadtrip API" do
  describe 'Roadtrip Post' do
    let(:user) { create(:user) }
    let(:api_key) { user.api_key }
    let(:trip_params) { {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: api_key
    }.to_json }
    let(:result) { JSON.parse(response.body, symbolize_names: true)}

    before { post '/api/v1/road_trip',  params: trip_params }

    it 'posts a road trip' do

      expect(response).to be_successful
      expect(result[:data]).to have_key(:id)
      expect(result[:data][:id]).to eq(nil)
      expect(result[:data][:type]).to eq('roadtrip')
      expect(result[:data]).to have_key(:attributes)
      expect(result[:data][:attributes]).to be_a(Hash)

      expect(result[:data][:attributes]).to have_key(:end_city)
      expect(result[:data][:attributes]).to have_key(:start_city)
      expect(result[:data][:attributes]).to have_key(:travel_time)
      expect(result[:data][:attributes]).to have_key(:weather_at_eta)
      expect(data[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    end

    it 'returns error message for invalid API key' do
      post '/api/v1/road_trip', params: {
        "origin": "Denver,CO",
        "destination": "Pueblo,CO",
        "api_key": "notanapikey"
      }, as: :json

      body = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(body[:error]).to eq("Invalid API key")
    end
  end
end

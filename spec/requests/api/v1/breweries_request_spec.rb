require 'rails_helper'

describe 'breweries API', :vcr do
  it 'gets 5 breweries from a location' do
    get '/api/v1/breweries?location=denver,co&quantity=5'

    expect(response).to be_successful
    brew = JSON.parse(response.body, symbolize_names: true)

    expect(brew[:data]).to be_a(Hash)
    expect(brew[:data][:id]).to eq(nil)
    expect(brew[:data][:type]).to eq('breweries')
  end
end

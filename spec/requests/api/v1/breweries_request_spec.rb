require 'rails_helper'

describe 'breweries API', :vcr do
  it 'gets 5 breweries from a location' do
    get '/api/v1/breweries?location=denver,co&quantity=5'

    expect(response).to be_successful
    brew = JSON.parse(response.body, symbolize_names: true)

    expect(brew).to have_key(:data)
    expect(brew[:data]).to be_a(Hash)

    expect(brew[:data]).to have_key(:id)
    expect(brew[:data]).to have_key(:type)
    expect(brew[:data]).to have_key(:attributes)
    expect(brew[:data][:id]).to eq(nil)
    expect(brew[:data][:type]).to eq('breweries')
    expect(brew[:data][:attributes]).to be_a(Hash)

    expect(brew[:data][:attributes]).to have_key(:destination)
    expect(brew[:data][:attributes]).to have_key(:forecast)
    expect(brew[:data][:attributes]).to have_key(:breweries)
    expect(brew[:data][:attributes][:destination]).to be_a(String)
    expect(brew[:data][:attributes][:forecast]).to be_a(Hash)

    expect(brew[:data][:attributes][:breweries]).to be_an(Array)
    brew_attr= brew[:data][:attributes][:breweries].first
    expect(brew_attr[:id]).to be_a(String)
    expect(brew_attr[:name]).to be_a(String)
    expect(brew_attr[:brewery_type]).to be_a(String)
  end

  it 'defaults to 20 breweries if not given a valid quantity' do
    get '/api/v1/breweries?location=denver,co&quantity=-1'

    expect(response).to be_successful
    brew = JSON.parse(response.body, symbolize_names: true)

    expect(brew[:data][:attributes][:breweries].count).to eq(20)
  end
end

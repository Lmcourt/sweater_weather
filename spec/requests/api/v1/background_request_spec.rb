require 'rails_helper'

describe 'background API', :vcr do
  it 'gets background for a location' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    background = JSON.parse(response.body, symbolize_names: true)
    expect(background[:data]).to be_a(Hash)
    expect(background[:data][:id]).to eq(nil)
    expect(background[:data][:type]).to eq('image')
    expect(background[:data][:attributes]).to be_a(Hash)

    attr = background[:data][:attributes]
    expect(attr).to have_key(:location)
    expect(attr[:location]).to be_a(String)
    expect(attr).to have_key(:image)
    expect(attr[:image]).to be_a(String)
    expect(attr).to have_key(:credit)
    expect(attr[:credit]).to be_a(Hash)
    expect(attr[:credit]).to have_key(:source)
    expect(attr[:credit][:source]).to be_a(String)
    expect(attr[:credit]).to have_key(:photographer)
    expect(attr[:credit][:photographer]).to be_a(String)
    expect(attr[:credit]).to have_key(:photographer_url)
    expect(attr[:credit][:photographer_url]).to be_a(String)

  end
end

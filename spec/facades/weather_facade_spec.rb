require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  it 'gets weather info' do
    weather = WeatherFacade.weather_by_location('Denver,co')
    expect(weather).to be_a(Weather)
  end

  it 'gets map coordinates' do
    coords = WeatherFacade.coordinates('Denver,CO')
    expect(coords).to eq({ lat: 39.738453, lng: -104.984853 })
  end
end

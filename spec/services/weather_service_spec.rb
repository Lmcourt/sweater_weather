require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  it 'returns weather data by location' do
    weather = WeatherService.weather_by_location({ lat: 40.039401, lng: -76.307078 })
    expect(weather).to be_a(Hash)
    expect(weather.size).to eq(7)
    expect(weather[:current]).to be_a(Hash)
    expect(weather[:current]).to be_a(Hash)
    expect(weather[:hourly]).to be_a(Array)
    expect(weather[:hourly].first).to be_a(Hash)
    expect(weather[:daily]).to be_a(Array)
    expect(weather[:daily].first).to be_a(Hash)
  end
end

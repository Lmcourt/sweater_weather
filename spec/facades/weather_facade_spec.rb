require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  it 'gets weather info' do
    weather = WeatherFacade.weather_by_location('Denver,co')
    expect(weather).to be_a(Weather)
  end

end

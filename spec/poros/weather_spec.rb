require 'rails_helper'

RSpec.describe Weather, :vcr do
  it 'has attributes' do
    response = File.read('spec/fixtures/weather.json')
    weather_info = JSON.parse(response, symbolize_names: true)
    weather = Weather.new(weather_info)

    expect(weather.id).to eq(nil)

    expect(weather.current_weather).to eq({
      datetime: 'Sun, 14 Nov 2021 23:48:56 UTC +00:00',
      sunrise: 'Sun, 14 Nov 2021 13:43:51 UTC +00:00',
      sunset: 'Sun, 14 Nov 2021 23:45:14 UTC +00:00',
      temp: 62.78,
      feels_like: 60.08,
      humidity: 28,
      visibility: 10000,
      uvi: 10000,
      conditions: "scattered clouds",
      icon: "03n"
      })

      expect(weather.daily_weather).to eq( [{
        datetime: 'Sun, 14 Nov 2021 18:00:00 UTC +00:00',
        sunrise: 'Sun, 14 Nov 2021 13:43:51 UTC +00:00',
        sunset: 'Sun, 14 Nov 2021 23:45:14 UTC +00:00',
        max_temp: 66.2,
        min_temp: 39.38,
        conditions: "broken clouds",
        icon: "04d"},
       {datetime: 'Mon, 15 Nov 2021 18:00:00 UTC +00:00',
        sunrise: 'Mon, 15 Nov 2021 13:45:00 UTC +00:00',
        sunset: 'Mon, 15 Nov 2021 23:44:27 UTC +00:00',
        max_temp: 70.03,
        min_temp: 51.82,
        conditions: "overcast clouds",
        icon: "04d"},
       {datetime: 'Tue, 16 Nov 2021 18:00:00 UTC +00:00',
        sunrise: 'Tue, 16 Nov 2021 13:46:09 UTC +00:00',
        sunset: 'Tue, 16 Nov 2021 23:43:41 UTC +00:00',
        max_temp: 69.12,
        min_temp: 47.79,
        conditions: "overcast clouds",
        icon: "04d"},
       {datetime: 'Wed, 17 Nov 2021 18:00:00 UTC +00:00',
        sunrise: 'Wed, 17 Nov 2021 13:47:17 UTC +00:00',
        sunset: 'Wed, 17 Nov 2021 23:42:57 UTC +00:00',
        max_temp: 47.12,
        min_temp: 34.95,
        conditions: "clear sky",
        icon: "01d"},
       {datetime: 'Thu, 18 Nov 2021 18:00:00 UTC +00:00',
        sunrise: 'Thu, 18 Nov 2021 13:48:26 UTC +00:00',
        sunset: 'Thu, 18 Nov 2021 23:42:16 UTC +00:00',
        max_temp: 48.4,
        min_temp: 32.56,
        conditions: "overcast clouds",
        icon: "04d"}])

    expect(weather.hourly_weather).to eq(
      [{datetime: 'Sun, 14 Nov 2021 23:00:00 UTC +00:00', temperature: 63.28, conditions: "scattered clouds", icon: "03d"},
        {datetime: 'Mon, 15 Nov 2021 00:00:00 UTC +00:00', temperature: 62.78, conditions: "scattered clouds", icon: "03n"},
        {datetime: 'Mon, 15 Nov 2021 01:00:00 UTC +00:00', temperature: 62.64, conditions: "scattered clouds", icon: "03n"},
        {datetime: 'Mon, 15 Nov 2021 02:00:00 UTC +00:00', temperature: 61.63, conditions: "few clouds", icon: "02n"},
        {datetime: 'Mon, 15 Nov 2021 03:00:00 UTC +00:00', temperature: 59.88, conditions: "few clouds", icon: "02n"},
        {datetime: 'Mon, 15 Nov 2021 04:00:00 UTC +00:00', temperature: 57.96, conditions: "few clouds", icon: "02n"},
        {datetime: 'Mon, 15 Nov 2021 05:00:00 UTC +00:00', temperature: 55.56, conditions: "clear sky", icon: "01n"},
        {datetime: 'Mon, 15 Nov 2021 06:00:00 UTC +00:00', temperature: 54.14, conditions: "clear sky", icon: "01n"}]
      )
  end
end

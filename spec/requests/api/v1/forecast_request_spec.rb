require 'rails_helper'

describe 'forecast API', :vcr do
  it 'gets the forecast for a location' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast[:data]).to be_a(Hash)
    expect(forecast[:data][:id]).to eq(nil)
    expect(forecast[:data][:type]).to eq('forecast')
    expect(forecast[:data][:attributes]).to be_a(Hash)
    attr = forecast[:data][:attributes]

    current = attr[:current_weather]
    expect(current).to be_a(Hash)
    current_keys = [:datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :visibility, :uvi, :conditions, :icon]
    not_current_keys = [:pressure, :dew_point, :clouds, :wind_deg, :wind_gust]
    expect(current.keys).to eq(current_keys)
    expect(current.keys).to_not eq(not_current_keys)
    expect(attr[:hourly_weather]).to be_an(Array)

    hourly = attr[:hourly_weather].first
    hourly_keys = [:datetime, :temperature, :conditions, :icon]
    not_hourly_keys = [:pressure, :dew_point, :clouds, :uvi, :visibility, :wind_deg, :wind_gust, :wind_speed]
    expect(hourly.keys).to eq(hourly_keys)
    expect(hourly.keys).to_not eq(not_hourly_keys)

    daily = attr[:daily_weather].first
    daily_keys = [:datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon]
    not_daily_keys = [:sunrise, :sunset, :moonrise, :moonset, :moon_phase, :pressure, :humidity, :dew_point]
    expect(attr[:daily_weather]).to be_an(Array)
    expect(daily.keys).to eq(daily_keys)
    expect(daily.keys).to_not eq(not_daily_keys)
  end
end

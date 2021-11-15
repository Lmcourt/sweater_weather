class WeatherService
  class << self

    def weather_by_location(coords)
      WeatherClient.get_data("/data/2.5/onecall?lat=#{coords[:lat]}&lon=#{coords[:lng]}")
    end
  end
end

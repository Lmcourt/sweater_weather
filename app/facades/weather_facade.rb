class WeatherFacade
  class << self
    def weather_by_location(location)
      weather_info = WeatherService.weather_by_location(coordinates(location))
      Weather.new(weather_info)
    end

    def coordinates(location)
      MapService.map_data(location)
    end
  end
end

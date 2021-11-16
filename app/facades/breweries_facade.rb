class BreweriesFacade
  class << self
    def breweries_by_location(location, quantity)
      breweries = BreweriesService.breweries_by_location(coordinates(location), quantity)
      Breweries.new(destination: location, breweries: breweries, forecast: weather_info(location))
    end

    def coordinates(location)
      WeatherFacade.coordinates(location)
    end

    def weather_info(location)
      weather = WeatherFacade.weather_by_location(location)
      { summary: weather.current_weather[:conditions], temperature: weather.current_weather[:temp]}
    end
  end
end

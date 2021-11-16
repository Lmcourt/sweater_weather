class BreweriesFacade
  class << self
    def breweries_by_location(location, quantity)
      coords = WeatherFacade.coordinates(location)
      weather_info = WeatherFacade.weather_by_location(location)
      weather = { summary: weather_info.current_weather[:conditions], temperature: weather_info.current_weather[:temp]}
      breweries = BreweriesService.breweries_by_location(coords, quantity)
      Breweries.new(destination: location, breweries: breweries, forecast: weather)
    end
  end
end

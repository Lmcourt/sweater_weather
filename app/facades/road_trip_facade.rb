class RoadTripFacade
  class << self
    def road_trip(start_city, end_city)
      route = MapService.route(start_city, end_city)
      weather = WeatherFacade.weather_by_location(end_city)
      travel_time = time_split(route)
      time = eta_time(route)

      route_details = {
        start_city: start_city,
        end_city: end_city,
        travel_time: travel_time,
        weather: weather,
        time: time
      }
      RoadTrip.new(route_details)
    end

    def time_split(route)
      route[:formattedTime].split(':') if route[:routeError][:errorCode] == (-400)
    end

    def eta_time(route)
      Time.zone.now + route[:realTime] if route[:routeError][:errorCode] == (-400)
    end
  end
end

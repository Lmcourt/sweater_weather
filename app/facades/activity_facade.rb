class ActivityFacade
  class << self
    def activity_by_type(type, location)
      activity = ActivityService.activity_by_type(type)
      weather = WeatherFacade.weather_by_location(location)
      Activity.new(location, activity, weather)
    end
  end
end

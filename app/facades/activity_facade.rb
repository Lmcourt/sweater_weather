class ActivityFacade
  class << self
    def activity_by_type(location)
      weather_info = WeatherFacade.weather_by_location(location)
      weather = { summary: weather_info.current_weather[:condtions], temperature: weather_info.current_weather[:temp]}
      # require "pry"; binding.pry
      activities = []

      activities << ActivityService.activity_by_type('relaxation')

      if weather[:temperature] >= 60
        activities << ActivityService.activity_by_type('recreational')

      elsif weather[:temperature] >= 50 && weather[:temperature] < 60
        activities << ActivityService.activity_by_type('busywork')
      else
        activities << ActivityService.activity_by_type('cooking')
      end
      Activity.new(destination: location, activities: activities, forecast: weather)
    end
  end
end

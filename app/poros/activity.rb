class Activity
  attr_reader :id, :activities, :destination, :forecast

  def initialize(location, activity_info, weather_info)
    @id = nil
    @destination = location
    @forecast = weather_forecast(weather_info)
    @activities = activity(activity_info)
    # require "pry";  binding.pry
  end

  def weather_forecast(weather)
    {
      summary: weather.current_weather[:condtions],
      temperature: weather.current_weather[:temp]
    }
  end

  def activity(act)
    {
      title: act[:activity],
      type: act[:type],
      participants: act[:participants],
      price: act[:price]
    }
  end
end

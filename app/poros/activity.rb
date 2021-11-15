class Activity
  attr_reader :id, :activities, :destination, :forecast

  def initialize(location, activity_info, weather_info)
    @id = nil
    @destination = location
    @forecast = weather_forecast(weather_info)
    @activities = activity(activity_info)
  end

  def weather_forecast(weather)
    {
      summary: weather.current_weather[:condtions],
      temperature: weather.current_weather[:temp]
    }
  end

  def activity(weather, act)
    if weather_forecast(weather[:temperature] >= 60)
      {
        title: act[:activity],
        type: 'recreational',
        participants: act[:participants],
        price: act[:price]
      }
      require "pry"; binding.pry
    elsif weather_forecast(weather[:temperature] >= 50 && weather[:temperature < 60])
      {
        title: act[:activity],
        type: busywork,
        participants: act[:participants],
        price: act[:price]
      }
    elsif weather_forecast(weather[:temperature] < 50)
      {
        title: act[:activity],
        type: 'cooking',
        participants: act[:participants],
        price: act[:price]
      }
    else
      {
        title: act[:activity],
        type: act[:type],
        participants: act[:participants],
        price: act[:price]
      }
    end
  end
end

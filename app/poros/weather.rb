class Weather
  attr_reader :id, :current_weather, :daily_weather, :hourly_weather
  def initialize(data)
    @id = nil
    @current_weather = current(data[:current])
    @daily_weather = daily(data[:daily].take(5))
    @hourly_weather = hourly(data[:hourly].take(8))
  end

  def current(current)
    {
      datetime: Time.zone.at(current[:dt]),
      sunrise: Time.zone.at(current[:sunrise]),
      sunset: Time.zone.at(current[:sunset]),
      temp: current[:temp],
      feels_like: current[:feels_like],
      humidity: current[:humidity],
      visibility: current[:visibility],
      uvi: current[:visibility],
      conditions: current[:weather].first[:description],
      icon: current[:weather].first[:icon]
    }
  end

  def daily(daily)
    daily.map do |day|
      {
        datetime: Time.zone.at(day[:dt]),
        sunrise: Time.zone.at(day[:sunrise]),
        sunset: Time.zone.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather].first[:description],
        icon: day[:weather].first[:icon]
      }
    end
  end

  def hourly(hourly)
    hourly.map do |hour|
      {
        datetime: Time.zone.at(hour[:dt]),
        temperature: hour[:temp],
        conditions: hour[:weather].first[:description],
        icon: hour[:weather].first[:icon]
      }
    end
  end
end

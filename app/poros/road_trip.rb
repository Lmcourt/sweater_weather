class RoadTrip
  attr_reader :id, :start_city, :end_city,
              :travel_time, :weather_at_eta

  def initialize(data)
    @id = nil
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = time(data)
    @weather_at_eta = weather_info(data)
  end

  private

  def time(data)
    if data[:time].nil?
      'impossible route'
    else
      "#{data[:travel_time][0]} hour(s), #{data[:travel_time][1]} minute(s)"
    end
  end

  def weather_info(data)
    if time(data) == 'impossible route'
      {}
    else
      weather = data[:weather].hourly_weather.find do |hour|
        hour[:datetime] == data[:time].beginning_of_hour
      end
      {
        temperature: weather[:temperature],
        conditions: weather[:conditions]
      }
    end
  end
end

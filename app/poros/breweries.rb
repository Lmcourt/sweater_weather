class Breweries
  attr_reader :id, :breweries, :destination, :forecast

  def initialize(data)
    @id = nil
    @breweries = brewery(data[:breweries])
    @forecast = weather_info(data[:forecast])
    @destination = data[:destination]
  end

  def weather_info(weather)
    { summary: weather[:summary], temperature: weather[:temperature].to_s + " F" }
  end

  def brewery(data)
    data.map do |brew|
      {
        id: brew[:id],
        name: brew[:name],
        brewery_type: brew[:brewery_type]
      }
    end
  end
end

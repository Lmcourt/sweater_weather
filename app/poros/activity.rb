class Activity
  attr_reader :id, :activities, :destination, :forecast

  def initialize(data)
    @id = nil
    # require "pry"; binding.pry
    @destination = data[:destination]
    @forecast = weather_info(data[:forecast])
    @activities = activity(data[:activities])
  end

  def weather_info(weather)
    { summary: weather[:summary], temperature: weather[:temperature].to_s + " F" }
    # require "pry"; binding.pry
  end

  def activity(data)
    # require "pry"; binding.pry
    data.map do |act|
      {
        title: act[:activity],
        type: act[:type],
        participants: act[:participants],
        price: act[:price]
      }
    end
  end
end

class WeatherClient
  class << self
    def get_data(url)
      parse_data(conn.get(url))
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(
        url: "http://api.openweathermap.org",
        params: {
          appid: ENV['open_weather_api'],
          units: 'imperial',
          exclude: 'minutely,alerts'
        }
      )
    end
  end
end

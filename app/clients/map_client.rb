class MapClient
  class << self
    def get_data(url)
      parse_data(conn.get(url))
    end

    def get_directions(url, data)
      response = conn.get(url) do |r|
        r.params['from'] = data[:origin]
        r.params['to'] = data[:destination]
      end
      parse_data(response)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(
        url: "http://www.mapquestapi.com",
        params: { key: ENV['map_api'] },
        headers: { 'Content-Type' => 'application/json' }
      )
    end
  end
end

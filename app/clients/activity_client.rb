class ActivityClient
  class << self
    def get_data(url)
      parse_data(conn.get(url))
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new(url: 'http://www.boredapi.com')
    end
  end
end

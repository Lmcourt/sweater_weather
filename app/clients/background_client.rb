class BackgroundClient
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
        url: "https://api.unsplash.com",
        params: {
          client_id: ENV['background_api'],
          per_page: 1
        }
      )
    end
  end
end

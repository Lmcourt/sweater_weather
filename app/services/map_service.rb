class MapService
  class << self

    def map_data(location)
      filter_data(MapClient.get_data("/geocoding/v1/address?location=#{location}"))
    end

    def filter_data(result)
      result[:results].first[:locations].first[:latLng]
    end

    def route(from, to)
      MapClient.get_directions("/directions/v2/route", origin: from, destination: to)[:route]
    end
  end
end

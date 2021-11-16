class BreweriesService
  class << self
    def breweries_by_location(location, quantity)
      BreweriesClient.get_data("/breweries?by_dist=#{location}&per_page=#{quantity}")
    end
  end
end

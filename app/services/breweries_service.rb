class BreweriesService
  class << self
    def breweries_by_location(coords, quantity)
      BreweriesClient.get_data("/breweries?by_dist=#{coords[:lat]},#{coords[:lng]}&per_page=#{quantity}")
    end
  end
end

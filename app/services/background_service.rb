class BackgroundService
  class << self
    def photo_by_location(location)
      BackgroundClient.get_data("/search/photos?query=#{location}")[:results].first
    end
  end
end

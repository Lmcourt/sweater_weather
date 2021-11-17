class BackgroundFacade
  class << self
    def photo_by_location(location)
      photo_info = BackgroundService.photo_by_location(location)
      Background.new(photo_info, location)
    end
  end
end

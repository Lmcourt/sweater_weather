class ActivityService
  class << self
    def activity_by_type(type)
      ActivityClient.get_data("/api/activity?type=#{type}")
    end
  end
end

class ActivityFacade
  class << self
    def activity_by_type(type)
      activity = ActivityService.activity_by_type(type)
      Activity.new(activity)
    end
  end
end

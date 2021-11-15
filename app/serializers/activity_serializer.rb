class ActivitySerializer
  include JSONAPI::Serializer
  attributes :destination, :forecast, :activities
end

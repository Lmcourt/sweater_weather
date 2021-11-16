class ImageSerializer
  include JSONAPI::Serializer
  attributes :location, :image, :credit
end

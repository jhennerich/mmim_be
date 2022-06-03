class MidpointSerializer
  include JSONAPI::Serializer
  attributes :lat,
             :lng
end

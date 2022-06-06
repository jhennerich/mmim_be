class SearchSerializer
  include JSONAPI::Serializer
  attributes :lat,
             :lng
end

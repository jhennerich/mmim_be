class LocationSerializer
  include JSONAPI::Serializer
  attributes :id,
             :name,
             :place_id,
             :address,
             :lat,
             :lng,
             :rating,
             :image_url,
             :price_level
end

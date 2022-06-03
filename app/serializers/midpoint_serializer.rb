class MidpointSerializer
  include JSONAPI::Serializer
  attributes :name,
             :place_id,
             :address,
             :lat,
             :lng,
             :rating,
             :image_url,
             :price_level
end

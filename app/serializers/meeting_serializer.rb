class MeetingSerializer
  include JSONAPI::Serializer
  attributes :host_name, :guest_name, :location_name, :location_address
end

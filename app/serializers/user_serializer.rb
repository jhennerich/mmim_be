class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :address
end

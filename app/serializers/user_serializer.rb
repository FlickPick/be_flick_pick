class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :role
end
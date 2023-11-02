class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :role, :movie_history
end
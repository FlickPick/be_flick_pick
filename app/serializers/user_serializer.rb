class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :role, :language_pref, :movie_history
end
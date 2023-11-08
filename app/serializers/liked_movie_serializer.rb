class LikedMovieSerializer
  include JSONAPI::Serializer
  attributes :id, :temp_user_id, :movie_id, :round
end
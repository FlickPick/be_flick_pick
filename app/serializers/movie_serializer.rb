class MovieSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :runtime, :title, :poster_path, :genres
end
class MovieSerializer
  include JSONAPI::Serializer
  attributes :rating, :runtime, :year_released, :language, :title, :poster_path, :genres
end
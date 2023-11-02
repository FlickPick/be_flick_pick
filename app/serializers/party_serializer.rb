class PartySerializer
  include JSONAPI::Serializer
  attributes :access_code, :max_rating, :max_duration, :genres, :services, :movie_id
end
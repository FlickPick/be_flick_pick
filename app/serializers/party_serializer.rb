class PartySerializer
  include JSONAPI::Serializer
  attributes :access_code, :max_rating, :max_duration, :genres, :services, :movie_id

  # has_many :user_parties
  # has_many :users, through: :user_parties

  # attribute :users
end
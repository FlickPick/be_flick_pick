class TempUserSerializer
  include JSONAPI::Serializer
  attributes :name, :party_id
end
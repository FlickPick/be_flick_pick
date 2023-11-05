require "rails_helper"

RSpec.describe Cast do
  it "exists" do
    attributes = {
      "id": 550,
      "cast": [
        {
          "adult": false,
          "gender": 2,
          "id": 819,
          "known_for_department": "Acting",
          "name": "Edward Norton",
          "original_name": "Edward Norton",
          "popularity": 24.089,
          "profile_path": "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
          "cast_id": 4,
          "character": "The Narrator",
          "credit_id": "52fe4250c3a36847f80149f3",
          "order": 0
        },
        {
          "adult": false,
          "gender": 2,
          "id": 287,
          "known_for_department": "Acting",
          "name": "Brad Pitt",
          "original_name": "Brad Pitt",
          "popularity": 38.927,
          "profile_path": "/eAOtKAc4p2C3DV8TGJQJzw8DeRv.jpg",
          "cast_id": 5,
          "character": "Tyler Durden",
          "credit_id": "52fe4250c3a36847f80149f7",
          "order": 1
        },
        {
          "adult": false,
          "gender": 1,
          "id": 1283,
          "known_for_department": "Acting",
          "name": "Helena Bonham Carter",
          "original_name": "Helena Bonham Carter",
          "popularity": 37.133,
          "profile_path": "/DDeITcCpnBd0CkAIRPhggy9bt5.jpg",
          "cast_id": 285,
          "character": "Marla Singer",
          "credit_id": "631f0de8bd32090082733691",
          "order": 2
        },
        {
          "adult": false,
          "gender": 2,
          "id": 7470,
          "known_for_department": "Acting",
          "name": "Meat Loaf",
          "original_name": "Meat Loaf",
          "popularity": 9.181,
          "profile_path": "/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg",
          "cast_id": 7,
          "character": "Robert \"Bob\" Paulson",
          "credit_id": "52fe4250c3a36847f80149ff",
          "order": 3
        },
        {
          "adult": false,
          "gender": 2,
          "id": 7499,
          "known_for_department": "Acting",
          "name": "Jared Leto",
          "original_name": "Jared Leto",
          "popularity": 24.562,
          "profile_path": "/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg",
          "cast_id": 286,
          "character": "Angel Face",
          "credit_id": "631f0e29ce9e91007f757d86",
          "order": 4
        },
        {
          "adult": false,
          "gender": 2,
          "id": 7471,
          "known_for_department": "Acting",
          "name": "Zach Grenier",
          "original_name": "Zach Grenier",
          "popularity": 7.558,
          "profile_path": "/fSyQKZO39sUsqY283GXiScOg3Hi.jpg",
          "cast_id": 31,
          "character": "Richard Chesler",
          "credit_id": "52fe4250c3a36847f8014a55",
          "order": 5
        }
      ]
    }

    cast = Cast.new(attributes)

    expect(cast).to be_a(Cast)
    expect(cast.names).to eq(["Edward Norton", "Brad Pitt", "Helena Bonham Carter", "Meat Loaf", "Jared Leto"])
  end
end
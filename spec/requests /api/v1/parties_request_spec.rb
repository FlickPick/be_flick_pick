require 'rails_helper'

describe "Parties API", type: :request do
  it "sends a list of parties" do
    create_list(:party, 5)

    get api_v1_parties_path

    expect(response).to be_successful

    parties = JSON.parse(response.body, symbolize_names: true)

    expect(parties[:data].count).to eq(5)

    parties[:data].each do |party|
      expect(parties).to have_key(:data)
      expect(parties[:data]).to be_an(Array)
      
      expect(party).to have_key(:id)
      expect(party[:id]).to be_an(String)

      expect(party).to have_key(:attributes)
      expect(party[:attributes]).to have_key(:access_code)
      expect(party[:attributes][:access_code]).to be_a(String)

      expect(party[:attributes]).to have_key(:max_rating)
      expect(party[:attributes][:max_rating]).to be_a(Integer)

      expect(party[:attributes]).to have_key(:max_duration)
      expect(party[:attributes][:max_duration]).to be_a(Integer)

      expect(party[:attributes]).to have_key(:genres)
      expect(party[:attributes][:genres]).to be_a(String)

      expect(party[:attributes]).to have_key(:services)
      expect(party[:attributes][:services]).to be_a(String)

      expect(party[:attributes]).to have_key(:languages)
      expect(party[:attributes][:languages]).to be_a(String)

      expect(party[:attributes]).to have_key(:format)
      expect(party[:attributes][:format]).to be_a(Integer)

      expect(party[:attributes]).to have_key(:movie_id)
      expect(party[:attributes][:movie_id]).to be_a(Integer)
    end
  end

  it "can get one party by its id" do
    id = create(:party).id
    
    get api_v1_party_path(id)

    party = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(party).to have_key(:data)
    expect(party[:data]).to be_a(Hash)
    
    expect(party[:data]).to have_key(:id)
    expect(party[:data][:id]).to be_an(String)

    expect(party[:data]).to have_key(:attributes)

    expect(party[:data][:attributes]).to have_key(:access_code)
    expect(party[:data][:attributes][:access_code]).to be_a(String)

    expect(party[:data][:attributes]).to have_key(:max_rating)
    expect(party[:data][:attributes][:max_rating]).to be_a(Integer)

    expect(party[:data][:attributes]).to have_key(:max_duration)
    expect(party[:data][:attributes][:max_duration]).to be_a(Integer)

    expect(party[:data][:attributes]).to have_key(:genres)
    expect(party[:data][:attributes][:genres]).to be_a(String)

    expect(party[:data][:attributes]).to have_key(:services)
    expect(party[:data][:attributes][:services]).to be_a(String)

    expect(party[:data][:attributes]).to have_key(:languages)
    expect(party[:data][:attributes][:languages]).to be_a(String)

    expect(party[:data][:attributes]).to have_key(:format)
    expect(party[:data][:attributes][:format]).to be_a(Integer)

    expect(party[:data][:attributes]).to have_key(:movie_id)
    expect(party[:data][:attributes][:movie_id]).to be_a(Integer)
  end

  it "can create a new party" do
    party_params = ({
                    :access_code=>"r4ze7o",
                    :max_rating=>4,
                    :max_duration=>32,
                    :genres=>"[\"labore\"]",
                    :services=>"quis, dicta, sit",
                    :languages=>"unde, architecto",
                    :format=>0,
                    :movie_id=>46364
                  })
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_parties_path, headers: headers, params: JSON.generate(party: party_params)
    
    created_party = Party.last
  
    expect(response).to be_successful
    expect(created_party.access_code).to eq(party_params[:access_code])
    expect(created_party.max_rating).to eq(party_params[:max_rating])
    expect(created_party.max_duration).to eq(party_params[:max_duration])
    expect(created_party.genres).to eq(party_params[:genres])
    expect(created_party.services).to eq(party_params[:services])
    expect(created_party.languages).to eq(party_params[:languages])
    expect(created_party.format).to eq(party_params[:format])
    expect(created_party.movie_id).to eq(party_params[:movie_id])
  end
end
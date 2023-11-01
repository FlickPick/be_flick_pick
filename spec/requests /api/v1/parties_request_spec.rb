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
end
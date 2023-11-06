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
      expect(party[:attributes][:max_rating]).to be_a(String)

      expect(party[:attributes]).to have_key(:max_duration)
      expect(party[:attributes][:max_duration]).to be_a(Integer)

      expect(party[:attributes]).to have_key(:genres)
      expect(party[:attributes][:genres]).to be_a(String)

      expect(party[:attributes]).to have_key(:services)
      expect(party[:attributes][:services]).to be_a(String)

      expect(party[:attributes]).to have_key(:movie_id)
      expect(party[:attributes][:movie_id]).to be_a(Integer)
    end
  end

  it "can get one party by its id", :vcr do
    id = create(:party, movie_id: 550).id
    
    get api_v1_party_path(id)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(data).to have_key(:party)
    expect(data[:party]).to be_a(Hash)
    expect(data).to have_key(:movie)
    expect(data[:movie]).to have_key(:original_title)
    expect(data[:movie][:original_title]).to be_a(String)
    expect(data[:movie]).to have_key(:poster_path)
    expect(data[:movie][:poster_path]).to be_a(String)

    expect(data).to have_key(:cast)
    expect(data[:cast]).to be_an(Array)

    expect(data[:cast].first).to have_key(:character)
    expect(data[:cast].first).to have_key(:name)

    expect(data).to have_key(:trailer)
    expect(data[:trailer]).to be_a(Hash)
  end

  it "can create a new party" do
    party_params = {
                    :max_rating=>"PG-13",
                    :max_duration=>101,
                    :genres=>"28|12",
                    :services=>"8|15",
                    :movie_id=>46364
                  }
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_parties_path, headers: headers, params: JSON.generate(party: party_params)
    # require 'pry';binding.pry
    created_party = Party.last

    expect(response).to be_successful
    expect(created_party.access_code).to be_a(String)
    expect(created_party.max_rating).to eq(party_params[:max_rating])
    expect(created_party.max_duration).to eq(party_params[:max_duration])
    expect(created_party.genres).to eq(party_params[:genres])
    expect(created_party.services).to eq(party_params[:services])
    expect(created_party.movie_id).to eq(party_params[:movie_id])
  end

  it "can update an existing party" do
    id = create(:party).id
    previous_genres = Party.last.genres
    previous_access_code = Party.last.access_code
    party_params = { genres: "Horror" }
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch api_v1_party_path(id), headers: headers, params: JSON.generate({party: party_params})

    party = Party.find_by(id: id)
  
    expect(response).to be_successful
    expect(party.genres).to_not eq(previous_genres)
    expect(party.genres).to eq("Horror")
    expect(party.access_code).to eq(previous_access_code)
  end

  it "can destroy an party" do
    party = create(:party)
  
    expect(Party.count).to eq(1)
  
    delete api_v1_party_path(party.id)
  
    expect(response).to be_successful
    expect(Party.count).to eq(0)
    expect{Party.find(party.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
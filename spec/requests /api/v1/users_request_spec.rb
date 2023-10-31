require 'rails_helper'

describe "Users API", type: :request do
  it "sends a list of users" do
    create_list(:user, 5)

    get api_v1_users_path

    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)
    
    expect(users[:data].count).to eq(5)

    users[:data].each do |user|
      expect(users).to have_key(:data)
      expect(users[:data]).to be_an(Array)
      
      expect(user).to have_key(:id)
      expect(user[:id]).to be_an(String)

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to have_key(:name)
      expect(user[:attributes][:name]).to be_a(String)

      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)

      expect(user[:attributes]).to have_key(:role)
      expect(user[:attributes][:role]).to be_a(Integer)

      expect(user[:attributes]).to have_key(:language_pref)
      expect(user[:attributes][:language_pref]).to be_a(Integer)

      expect(user[:attributes]).to have_key(:movie_history)
      expect(user[:attributes][:movie_history]).to be_a(String)

      expect(user[:attributes]).to have_key(:password_digest)
      expect(user[:attributes][:password_digest]).to be_a(String)
    end
  end

  it "can get one user by its id" do
    id = create(:user).id
    
    get "/api/v1/users/#{id}"

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(String)

    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:role)
    expect(user[:data][:attributes][:role]).to be_a(Integer)

    expect(user[:data][:attributes]).to have_key(:language_pref)
    expect(user[:data][:attributes][:language_pref]).to be_a(Integer)

    expect(user[:data][:attributes]).to have_key(:movie_history)
    expect(user[:data][:attributes][:movie_history]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:password_digest)
    expect(user[:data][:attributes][:password_digest]).to be_a(String)
  end

  xit "can create a new user" do
    merchant = create(:merchant)

    item_params = ({
                    name: 'Cheesecake',
                    description: 'Oreo Cookie',
                    unit_price: 7.5,
                    merchant_id: merchant.id
                  })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
    
    created_item = Item.last
  
    expect(response).to be_successful
    expect(created_item.name).to eq(item_params[:name])
    expect(created_item.description).to eq(item_params[:description])
    expect(created_item.unit_price).to eq(item_params[:unit_price])
  end

  xit "can destroy an item" do
    item = create(:item)
  
    expect(Item.count).to eq(1)
  
    delete "/api/v1/items/#{item.id}"
  
    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
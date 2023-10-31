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
end
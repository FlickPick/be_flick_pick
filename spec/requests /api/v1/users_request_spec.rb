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
    end
  end

  it "can get one user by its id" do
    id = create(:user).id
    
    get api_v1_user_path(id)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(user).to have_key(:data)
    expect(user[:data]).to be_a(Hash)
    
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_an(String)

    expect(user[:data]).to have_key(:attributes)

    expect(user[:data][:attributes]).to have_key(:name)
    expect(user[:data][:attributes][:name]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)

    expect(user[:data][:attributes]).to have_key(:role)
    expect(user[:data][:attributes][:role]).to be_a(Integer)
  end

  it "can create a new user" do
    user_params = ({
                    name: 'James Sullivan',
                    email: 'james.p.sullivan@aol.com',
                    role: 1,
                    password: "gw45635yhethet5"
                  })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
    
    created_user = User.last
  
    expect(response).to be_successful
    expect(created_user.name).to eq(user_params[:name])
    expect(created_user.email).to eq(user_params[:email])
    expect(created_user.role).to eq(user_params[:role])
    expect(created_user.password).to eq(user_params[:password_digest])
  end

  it "sad path; will send an error if user is not created" do 
    user_params = ({
      name: "",
      email: 'james.p.sullivan@aol.com',
      role: 1,
      password: "gw45635yhethet5"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post api_v1_users_path, headers: headers, params: JSON.generate(user: user_params)
    expect(response).to_not be_successful 
    expect(response).to have_http_status(401)
  end

  it "can update an existing user" do
    id = create(:user).id
    previous_name = User.last.name
    password = User.last.password_digest
    user_params = { name: "P. Sherman" }
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch api_v1_user_path(id), headers: headers, params: JSON.generate({user: user_params})

    user = User.find_by(id: id)
    expect(response).to be_successful
    expect(user.name).to_not eq(previous_name)
    expect(user.name).to eq("P. Sherman")
  end

  it "sad path; will send an error if a user is not updated" do 
    id = create(:user).id
    previous_name = User.last.name
    password = User.last.password_digest
    user_params = { name: "" }
    headers = {"CONTENT_TYPE" => "application/json"}
  
    patch api_v1_user_path(id), headers: headers, params: JSON.generate({user: user_params})

    expect(response).to_not be_successful
    expect(response).to have_http_status(400)
  end

  it "can destroy an user" do
    user = create(:user)
  
    expect(User.count).to eq(1)
  
    delete api_v1_user_path(user.id)
  
    expect(response).to be_successful
    expect(User.count).to eq(0)
    expect{User.find(user.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
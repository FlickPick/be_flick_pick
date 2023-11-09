class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: {id: user.id}, status: :created
    else
      render json: {id: "bad cred"}, status: 401
    end
  end

  def github_create
    binding.pry
    user = User.find_or_create_by(gh_id: params[:id])
    user.gh_username = params[:login]
    user.gh_id = params[:id]
    user.gh_token   = params[:access_token]  "needs to be sent from the front"
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:access_token] "needs to be sent from the front"
    if user.save
      binding.pry
      render json: {id: user.id}, status: 201
    else
      binding.pry
      render json: {id: "invalid"}, status: 401
    end
  end
end

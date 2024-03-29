class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      render json: {id: user.id}, status: :created
    else
      render json: {id: "bad cred"}, status: 401
    end
  end
end

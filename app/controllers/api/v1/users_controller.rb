class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    render json: UserSerializer.new(User.find(params[:id]))
  end

  def create
    user = User.new(user_params)
    if user.save
      head 201
      response.body = UserSerializer.new(User.last).to_json
    else
      head 401
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :role, :language_pref, :movie_history, :password_digest) 
  end
end
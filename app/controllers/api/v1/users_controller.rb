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
      render json: UserSerializer.new(user), status: :created
    else
      head 401
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json: UserSerializer.new(user)
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end
  end

  def destroy
    render json: User.delete(params[:id])
  end

  def omniauth
    if User.find_by(uid: params[:user][:uid], provider: params[:user][:provider])
      render json: UserSerializer.new(User.where(uid: params[:user][:uid])), status: :accepted
    else
      user = User.create(uid: params[:user][:uid], provider: params[:user][:provider], name: params[:user][:info][:name], email: params[:user][:info][:email], password: SecureRandom.hex(10))
      render json: UserSerializer.new(user), status: :created
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation) 
  end
end
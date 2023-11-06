class Api::V1::TempUsersController < ApplicationController
  def create
    party_id = Party.find_by(access_code: params[:temp_user][:access_code]).id
    temp_user = TempUser.new(name: params[:temp_user][:name], party_id: party_id)
    if temp_user.save
      render json: {id: temp_user.id, party_id: party_id}, status: :created
    else
      head 401
    end
  end

  def index
    render json: TempUserSerializer.where('party_id = ?', params[:party_id])
  end

  private

  def temp_user_params
    params.require(:temp_user).permit(:name, :access_code)
  end
end
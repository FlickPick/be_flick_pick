class Api::V1::TempUsersController < ApplicationController
  def create
    temp_user = TempUser.new(temp_user_params)
    head 401 unless temp_user.save
  end

  private

  def temp_user_params
    params.require(:temp_user).permit(:name)
  end
end
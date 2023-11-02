class Api::V1::PartiesController < ApplicationController
  def index
    render json: PartySerializer.new(Party.all)
  end

  def show
    render json: PartySerializer.new(Party.find(params[:id]))
  end

  def create
    party = Party.new(party_params)
    if party.save
      render json: PartySerializer.new(party), status: :created
    else
      head 401
    end
  end

  def update
    party = Party.find(params[:id])
    if party.update(party_params)
      render json: PartySerializer.new(party)
    else
      render json: { errors: party.errors.full_messages }, status: 400
    end
  end

  def destroy
    render json: Party.delete(params[:id])
  end

  private
  
  def party_params
    params.require(:party).permit(:access_code, :max_rating, :max_duration, :genres, :services, :languages, :format, :movie_id) 
  end
end
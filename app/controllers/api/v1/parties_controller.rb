class Api::V1::PartiesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid

  def index
    render json: PartySerializer.new(Party.all)
  end

  def show
    render json: PartySerializer.new(Party.find(params[:id]))
  end

  def details
    party = Party.find(params[:id])
    movie_id = party.movie_id

    movie_data = MoviesService.new.movie(movie_id)
    cast_data = MoviesService.new.cast(movie_id)
    trailer_data = MoviesService.new.trailers(movie_id)
    if movie_data
      render json: {
        party: PartySerializer.new(party),
        movie: {
          original_title: movie_data[:original_title],
          poster_path: movie_data[:poster_path] 
        },
        cast: make_cast(cast_data),
        trailer: Trailer.new(trailer_data)
      }
    end
  end

  def create
    party = Party.create!(party_params)
    party.save
    render json: PartySerializer.new(party), status: :created
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
    params.require(:party).permit(:max_rating, :max_duration, :genres, :services, :movie_id) 
  end

  # def create_host(party)
  #   UserParty.create(party: party, user_id: params[:user_id], host: true)
  # end

  def make_cast(cast_data)
    cast_data.map do |cast_member|
      Cast.new(character: cast_member[:character], name: cast_member[:name])
    end
  end

  def handle_record_invalid(exception)
    render json: { error: exception.message }, status: 401
  end
end

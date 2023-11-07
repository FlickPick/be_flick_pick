class Api::V1::LikedMoviesController < ApplicationController
  def create
    liked_movie = LikedMovie.new(liked_movie_params)
    head 401 unless liked_movie.save
  end

  def index
    render json: LikedMovieSerializer.new(LikedMovie.join(:temp_user).where('temp_user.party_id': params[:party_id]))
  end

  private

  def liked_movie_params
    params.require(:liked_movie).permit(:movie_id, :round)
  end
end
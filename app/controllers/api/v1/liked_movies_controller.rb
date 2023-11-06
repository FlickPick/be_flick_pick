class Api::V1::LikedMoviesController < ApplicationController
  def create
    liked_movie = LikedMovie.new(liked_movie_params)
    head 401 unless liked_movie.save
  end

  def liked_movies_by_party
    render json: LikedMovieSerializer.new(LikedMovie.where(party_id: params[:party_id]))
  end

  private

  def liked_movie_params
    params.require(:like_data).permit(:movie_id, :round, :temp_user_id)
  end
end
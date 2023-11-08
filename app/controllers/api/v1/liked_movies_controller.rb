class Api::V1::LikedMoviesController < ApplicationController
  def create
    liked_movie = LikedMovie.new(liked_movie_params)
    head 401 unless liked_movie.save
  end

  def index
    # binding.pry
    # render json: LikedMovieSerializer.new(LikedMovie.joins(:temp_user).where('temp_users.party_id': params[:party_id]))
    render json: ((LikedMovie.joins(:temp_user)
                            .where('temp_users.party_id': params[:party_id])).map do |movie|
                              movie.movie_id
                            end).tally
  end

  private

  def liked_movie_params
    params.require(:like_data).permit(:movie_id, :round, :temp_user_id)
  end
end
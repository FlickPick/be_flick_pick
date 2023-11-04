class Api::V1::MoviesController < ApplicationController
  def show
    # render json: MovieSerializer.new(Movie.new(MoviesService.new.movie(params[:movie_id])))
    @facade = MoviesFacade.new(params[:movie_id])

    # FE Route - 
  end
end
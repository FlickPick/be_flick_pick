class Api::V1::MoviesController < ApplicationController
  def show
    render json: MovieSerializer.new(Movie.new(MoviesService.new.movie(params[:movie_id])))
  end
end
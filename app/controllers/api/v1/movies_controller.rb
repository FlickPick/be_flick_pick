class Api::V1::MoviesController < ApplicationController
  def show
    render json: MovieSerializer.new(make_movie(MoviesService.new.movie(params[:movie_id])))
  end

  def index(party_id, round)
    render json: MovieSerializer.new(round_movies(party_id, round))
  end

  private

  def make_movie(movie_data)
    Movie.new(movie_data)
  end

  def round_movies(party_id, round)
    find_round_movies(party_id, round).map do |movie_data|
      make_movie(movie_data)
    end
  end

  def find_round_movies(party_id, round)
    MovieService.new.movies_by_round(party_id, round)
  end
end
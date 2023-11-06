class Api::V1::MoviesController < ApplicationController
  def show
    render json: MovieSerializer.new(make_movie(MoviesService.new.movie(params[:movie_id])))
  end

  def index
    render json: round_movies(params[:party_id], params[:round])
  end

  private

  def make_movie(movie_data)
    Movie.new(movie_data)
  end

  def round_movies(party_id, round)
    find_round_movies(party_id, round)[:results].map do |data|
      data[:id]
    end
  end

  def find_round_movies(party_id, round)
    MoviesService.new.movies_by_round(party_id, round)
  end
end 
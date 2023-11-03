# frozen_string_literal: true

# app/facades/movies_facade.rb
class MoviesFacade
  def initialize(movie_id = nil)
    @movie_id = movie_id.to_i
  end

  def movie
    Movie.new(MoviesService.new.movie(@movie_id))
  end

  def cast
    data = MoviesService.new.cast(@movie_id)
    data.map do |cast_data|
      Cast.new(cast_data)
    end
  end
end
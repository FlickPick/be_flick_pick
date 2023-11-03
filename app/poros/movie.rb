class Movie
  attr_reader :rating, :runtime, :year_released, :language, :title, :poster_path, :genres

  def initialize(attributes)
    @rating = find_rating(attributes)
    @runtime = attributes[:runtime]
    @year_released = find_release_year(attributes)
    @language = attributes[:original_language]
    @title = attributes[:title]
    @poster_path = attributes[:poster_path]
    @genres = attributes[:genres]
  end

  ### REFACTOR ME!!! ALSO TEST ME!
  def find_rating(attributes)
    attributes[:release_dates][:results].find {|result| result[:iso_3166_1] == "US"}[:release_dates].find {|result| result[:certification] != ''}[:certification]
  end
  
  def find_release_year(attributes)
    # require 'pry';binding.pry
    to_year(attributes[:year_released])
    # @year_released = attributes[:release_date]&.to_year
  end

  def to_year(date)
    date.slice(0..3)
  end
end
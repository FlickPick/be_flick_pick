class Movie
  attr_reader :id, :rating, :runtime, :title, :poster_path, :genres

  def initialize(attributes)
    @id = attributes[:id]
    @rating = find_rating(attributes)
    @runtime = attributes[:runtime]
    @title = attributes[:title]
    @poster_path = attributes[:poster_path]
    @genres = attributes[:genres]
    # @year_released = find_release_year(attributes)
    
    # cast
    # summary
  end

  ### REFACTOR ME!!! ALSO TEST ME!
  def find_rating(attributes)
    attributes[:release_dates][:results].find {|result| result[:iso_3166_1] == "US"}[:release_dates].find {|result| result[:certification] != ''}[:certification]
  end
  
  def find_release_year(attributes)
    to_year(attributes[:year_released])
  end

  def to_year(date)
    date.slice(0..3)
  end
end
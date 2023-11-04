class Trailer
  attr_reader

  def initialize(attributes)
    @trailer_path = find_trailer_path(attributes)
  end

  def find_trailer_path(attributes)
    attributes[:results].find {|result| result[:type] == "Trailer"}
  end
end
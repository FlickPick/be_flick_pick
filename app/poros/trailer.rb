class Trailer 
  attr_reader :trailer

  def initialize(data)
    @trailer = trailer_find(data)
  end

  def trailer_find(data)
    data[:results].find{ |result| result[:type] == "Trailer" }[:key]
  end
end